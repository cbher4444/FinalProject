package com.kh.usTwo.album.controller;

import java.lang.reflect.Type;
import java.util.HashMap;

import com.google.api.services.photoslibrary.v1.model.MediaMetadata;
import com.google.gson.*;

public class MediaMetadataDeserializer implements JsonDeserializer<MediaMetadata>{

	@Override
    public MediaMetadata deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
		 MediaMetadata mediaMetadata = new MediaMetadata();
	        JsonObject jsonObject = json.getAsJsonObject();

	        if (jsonObject.has("creationTime")) {
	            mediaMetadata.setCreationTime(jsonObject.get("creationTime").getAsString());
	        }
	        if (jsonObject.has("width")) {
	            mediaMetadata.setWidth(jsonObject.get("width").getAsLong()); // long으로 변환
	        }
	        if (jsonObject.has("height")) {
	            mediaMetadata.setHeight(jsonObject.get("height").getAsLong()); // long으로 변환
	        }
	       
	        


        // photo 필드는 비어있음, 필요 없을 경우 생략할 수 있음
        return mediaMetadata;
    }
    


}
