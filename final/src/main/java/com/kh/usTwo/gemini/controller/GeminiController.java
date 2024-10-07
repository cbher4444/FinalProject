package com.kh.usTwo.gemini.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.usTwo.fun.model.service.FunServiceImpl;
import com.kh.usTwo.fun.model.vo.Alove;
import com.kh.usTwo.fun.model.vo.Aservey;
import com.kh.usTwo.fun.model.vo.Qlove;
import com.kh.usTwo.fun.model.vo.Qservey;
import com.kh.usTwo.gemini.model.service.GeminiServiceImpl;
import com.kh.usTwo.member.model.vo.Member;

@Controller
public class GeminiController {
	@Autowired
	private GeminiServiceImpl gService;
	
	@Autowired 
	private FunServiceImpl fService;
	
    private static final String API_KEY = "AIzaSyBpZ1NaMkkfmSIOHcMPs74kzGDAcnNHz6Q";
    private static final String MODEL_NAME = "gemini-pro";

    public String callGemini(String prompt) throws Exception {
        String urlString = "https://generativelanguage.googleapis.com/v1beta/models/" + MODEL_NAME + ":generateContent?key=" + API_KEY;
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);        

        JSONObject requestBody = createRequestBody(prompt);

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = requestBody.toJSONString().getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == 200) {
            return getResponse(conn);
        } else {
            handleErrorResponse(conn, responseCode);
            return null;
        }
    } 

    private JSONObject createRequestBody(String prompt) {
        JSONObject requestBody = new JSONObject();
        JSONArray contents = new JSONArray();
        JSONObject part = new JSONObject();
        part.put("text", prompt);
        JSONArray parts = new JSONArray();
        parts.add(part);

        JSONObject content = new JSONObject();
        content.put("parts", parts);
        contents.add(content);
        requestBody.put("contents", contents);
        return requestBody;
    }

    private String getResponse(HttpURLConnection conn) throws Exception {
        StringBuilder response = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }
        }

        JSONParser parser = new JSONParser();
        JSONObject jsonResponse = (JSONObject) parser.parse(response.toString());

        if (jsonResponse.containsKey("candidates")) {
            JSONArray candidates = (JSONArray) jsonResponse.get("candidates");
            StringBuilder message = new StringBuilder();
            for (Object candidate : candidates) {
                JSONObject content = (JSONObject) ((JSONObject) candidate).get("content");
                JSONArray parts = (JSONArray) content.get("parts");
                for (Object part : parts) {
                    message.append(((JSONObject) part).get("text").toString().replace("\n", "<br/>").replace("**", "")).append("<br />");
                }
            }
            System.out.println(message);
            return message.toString().trim();
        } else {
            return "No candidates found in the response.";
        }
    }

    private void handleErrorResponse(HttpURLConnection conn, int responseCode) throws Exception {
        StringBuilder errorResponse = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                errorResponse.append(responseLine.trim());
            }
        }

        switch (responseCode) {
            case 401:
                throw new RuntimeException("Failed: HTTP error code: 401 Unauthorized. Please check your API key and permissions.");
            case 400:
                throw new RuntimeException("Failed: HTTP error code: 400 Bad Request. Response: " + errorResponse.toString());
            default:
                throw new RuntimeException("Failed: HTTP error code: " + responseCode);
        }
    }
	
    @ResponseBody
	@RequestMapping(value="geminiQnA", method = RequestMethod.GET)
	public void callGeminiQnA(Member m, String prompt) {
		try {	 		
			ArrayList<Qlove> qList = fService.selectQlove(m);
	        ArrayList<Alove> aList = fService.selectAlove(m);
	        
	 		Qlove q = new Qlove();
	 		q.setQloveContent(prompt);
	 		q.setEmail(m.getEmail());
	 		q.setCoupleCode(m.getCoupleCode());
	 		
	 		int qResult = fService.insertQlove(q);
	        
	 		String question = "과거 대화 이력 \n";
			
			for (int i = 0; i < qList.size(); i++) {
				for (int j = 0; j < aList.size(); j++) {
					if(qList.get(i).getQloveNo() == aList.get(j).getQloveNo()) {
						question += "질문" + qList.get(i).getQloveContent() + "\n";
						question += "답변" + aList.get(j).getAloveContent() + "\n";
					}
				}
			}
			
			question += "\n\n위의 대화는 과거의 대화입니다.\n";
			question += "위의 대화에 기반하여 대화를 이어나가세요.\n";
			question += "아래 질문에 대한 답변은 위의 대화에 기반하지 않아도 됩니다.\n";
			question += "질문을 스스로 창작하지 마세요.\n";
			question += "질문은 스스로 창작할 수 없습니다.\n";
			question += "강조합니다. 질문을 스스로 창작하지 마세요.\n\n";
			question += "질문 : " + prompt;
	 		
	 		Alove a = new Alove();
	 		a.setAloveContent(callGemini(question));
	 		a.setEmail(m.getEmail());
	 		a.setCoupleCode(m.getCoupleCode());
	 		a.setQloveNo(fService.selectQloveOne(m).getQloveNo());
	 		
			int aResult = fService.insertAlove(a);			
		} catch (Exception e) {
			e.printStackTrace();
			prompt = "Error occurred while processing the request.";
		}
	}

    @ResponseBody
	@RequestMapping(value="geminiTest", method = RequestMethod.GET)
	public void callGeminiTest(Member m, String prompt) {
		ArrayList<Qservey> qList = fService.selectQservey();
		ArrayList<Aservey> aList = fService.selectAservey(m);
		
		String list = "";
		
		for (int i = 0; i < qList.size(); i++) {
			for (int j = 0; j < aList.size(); j++) {
				if(qList.get(i).getQserveyNo() == aList.get(j).getQserveyNo()) {
					list += "Q" + i + ". " + qList.get(i).getQserveyContent() + "\n";
					list += "A" + i + ". " + aList.get(j).getAserveyContent() + "\n";
				}
			}
		}
		
		list += "위 설문조사에는 A가 참여하였습니다.";
		list += "위 설문조사를 결과를 바탕으로 질문 10개를 작성하세요.";
		list += "각 질문에 대한 보기를 각각 4개씩 제시하세요.";
		list += "작성된 질문에는 B가 답을 할 것입니다. 고로 질문의 주어는 A가 되어야합니다.";
		list += "A와 B는 연인 관계입니다.";
		list += "아래와 같은 형식으로 답을 작성하세요.";
		list += "Q1. A가 좋아하는 사람은?";
		list += "A1. 홍길동";
		list += "A2. 이길동";
		list += "A3. 김길동";
		list += "A4. 박길동(answer)";
		list += "설문조사 결과에 존재하지 않는 정보에 기반한 질문은 존재하지 않습니다.";
		list += "(answer) 표시는 누락될 수 없습니다.";
		list += "예시에 사용된 'A가 좋아하는 사람은?'이라는 문제는 출제될 수 없습니다.";
		
	 	try {
			String response = callGemini(list);
		} catch (Exception e) {
			e.printStackTrace();
			prompt = "Error occurred while processing the request.";
		}
	}
}
