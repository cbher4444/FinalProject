<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/gojs@3.0.13/release/go.js"></script> <!-- 마인드맵 (gojs) -->
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>
	<script>
		// 메뉴바에 클릭된 메뉴 하이라이트
		$(()=>{ $(".nav-header #menubar_plan").addClass("active"); })
		$(()=>{ $(".nav-header #menubar_mindmap").addClass("active"); })
	</script>

	<!-- 메뉴 타이틀 -->
	<div id="fh5co-couple" class="fh5co-section-gray">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-12 text-center heading-section" style="position: relative; margin: 0;">
					<h2>🌠 커플 마인드맵</h2>
					<div style="position: absolute; top:30px; right:15px; display: flex; align-items: flex-end;">
						* 수정사항이 있으면 저장버튼이 활성화됩니다.
						<button id="SaveButton" onclick="save()" class="btn btn-primary btn-block" style="width: 100px; margin-left: 10px;">저장</button>
					</div>
					<!-- ----------------------------------- 마인드맵 (gojs) -------------------------------------- -->

					<div id="allSampleContent" class="p-4 w-full">

					<div id="sample">
						<div id="myDiagramDiv" style="border: solid 1px black; width: 100%; height: 700px;"></div>
						<br>
						<!-- <button onclick="load()">Load</button> -->
						
						<textarea id="mySavedModel" style="width: 100%; height: 400px; display: none;">
						</textarea>
						<!-- {
							"class": "go.TreeModel",
							"nodeDataArray": [
							  {"key": 0, "text": "커플마인드맵", "loc": "0 0"},
							  {"key": 1, "parent": 0, "text": "하고싶은것", "brush": "skyblue", "dir": "right", "loc": "193.078125 -136"},
							  {"key": 11, "parent": 1, "text": "번지점프", "brush": "skyblue", "dir": "right", "loc": "349.078125 -214"},
							  {"key": 12, "parent": 1, "text": "스카이다이빙", "brush": "skyblue", "dir": "right", "loc": "343.078125 -162"},
							  {"key": 13, "parent": 1, "text": "스쿠버다이빙", "brush": "skyblue", "dir": "right", "loc": "342.078125 -101"},
							  {"key": 2, "parent": 0, "text": "필요한것", "brush": "darkseagreen", "dir": "right", "loc": "175.078125 125"},
							  {"key": 21, "parent": 2, "text": "나", "brush": "darkseagreen", "dir": "right", "loc": "315.078125 75.5"},
							  {"key": 211, "parent": 21, "text": "면접용 정장", "brush": "darkseagreen", "dir": "right", "loc": "365.078125 49.5"},
							  {"key": 212, "parent": 21, "text": "수영복", "brush": "darkseagreen", "dir": "right", "loc": "365.078125 75.5"},
							  {"key": 22, "parent": 2, "text": "상대방", "brush": "darkseagreen", "dir": "right", "loc": "317.078125 195.5"},
							  {"key": 3, "parent": 0, "text": "가고싶은곳", "brush": "palevioletred", "dir": "left", "loc": "-145 -133.75"},
							  {"key": 31, "parent": 3, "text": "해외", "brush": "palevioletred", "dir": "left", "loc": "-245 -186.75"},
							  {"key": 32, "parent": 3, "text": "국내", "brush": "palevioletred", "dir": "left", "loc": "-258 -37.75"},
							  {"key": 331, "parent": 31, "text": "이탈리아", "brush": "palevioletred", "dir": "left", "loc": "-295 -212.75"},
							  {"key": 332, "parent": 31, "text": "스페인", "brush": "palevioletred", "dir": "left", "loc": "-295 -186.75"},
							  {"key": 4, "parent": 0, "text": "보고싶은것", "brush": "coral", "dir": "left", "loc": "-127 175.75"},
							  {"key": 41, "parent": 4, "text": "영화", "brush": "coral", "dir": "left", "loc": "-212 130.25"},
							  {"key": 42, "parent": 4, "text": "드라마", "brush": "coral", "dir": "left", "loc": "-212 195.25"},
							  {"key": -20, "parent": 31, "text": "프랑스", "brush": "palevioletred", "dir": "left", "loc": "-295 -160.75"},
							  {"key": -21, "parent": 32, "text": "제주도", "brush": "palevioletred", "dir": "left", "loc": "-308 -63.75"},
							  {"key": -22, "parent": 32, "text": "부산", "brush": "palevioletred", "dir": "left", "loc": "-308 -37.75"},
							  {"key": -23, "parent": 32, "text": "강릉", "brush": "palevioletred", "dir": "left", "loc": "-308 -11.75"},
							  {"key": -24, "parent": 41, "text": "버킷리스트", "brush": "coral", "dir": "left", "loc": "-262 117.25"},
							  {"key": -25, "parent": 41, "text": "행복을 찾아서", "brush": "coral", "dir": "left", "loc": "-262 143.25"},
							  {"key": -27, "parent": 42, "text": "미스터 션샤인", "brush": "coral", "dir": "left", "loc": "-271 169.25"},
							  {"key": -28, "parent": 42, "text": "기묘한 이야기", "brush": "coral", "dir": "left", "loc": "-271 195.25"},
							  {"key": -29, "parent": 42, "text": "워킹데드", "brush": "coral", "dir": "left", "loc": "-271 221.25"},
							  {"key": -30, "parent": 4, "text": "예능", "brush": "coral", "dir": "left", "loc": "-219 287.25"},
							  {"key": -31, "parent": -30, "text": "흑백요리사", "brush": "coral", "dir": "left", "loc": "-269 274.25"},
							  {"key": -32, "parent": -30, "text": "유퀴즈", "brush": "coral", "dir": "left", "loc": "-269 300.25"},
							  {"key": -33, "parent": 21, "text": "데스크탑 컴퓨터", "brush": "darkseagreen", "dir": "right", "loc": "365.078125 101.5"},
							  {"key": -34, "parent": 22, "text": "핸드폰 케이스", "brush": "darkseagreen", "dir": "right", "loc": "376.078125 169.5"},
							  {"key": -35, "parent": 22, "text": "가방", "brush": "darkseagreen", "dir": "right", "loc": "385.078125 207.5"},
							  {"key": -36, "parent": 22, "text": "여행용 캐리어", "brush": "darkseagreen", "dir": "right", "loc": "378.078125 249.5"}
							]
						  } -->
						</div> 
					</div>
					<!-- ----------------------------------- 끝 - 마인드맵 (gojs) -------------------------------------- -->
					
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

	<!-- ----------------------------------- HTML 끝. JS 시작!! -------------------------------------- -->
	
	<!-- 나의 JS 코드 -->
	<script>
		setInitialSetting(); // 마인드맵 초기세팅

		// ----------------------- 마인드맵 초기세팅 -----------------------
		async function setInitialSetting(){
			let mindmapList = await selectMindmapList(); // db조회
			displayMindmap(mindmapList);
			init(); // 마인드맵 라이브러리 세팅
		}

		// ----------------------- DB에서 마인드맵 데이터 가져오기 -----------------------
		function selectMindmapList(){
			return new Promise((resolve, reject) => {
				$.ajax({
					url:"mlist.pl",
					data:{
						coupleCode: '${loginUser.coupleCode}',
					},
					success:function(list){
						// console.log(list);
						resolve(list);
					}, error:function(){
						reject(new Error('selectMindmapList() -  ajax 통신 실패'));
					}
				})
			})
		}
		
		// ----------------------- 가져온 데이터 화면에 뿌려주기 -----------------------
		function displayMindmap(mindmapList){
			let mindmapData = {
				"class": "go.TreeModel",
				"nodeDataArray": "",
			};

			if(mindmapList.length !== 0) { // 기존에 db 데이터가 있는 경우
				mindmapData.nodeDataArray = mindmapList;
			}else { // 기존에 db 데이터가 없는 경우
				mindmapData.nodeDataArray = [
					{"key": 0, "text": "커플마인드맵", "loc": "0 0"},
					{"key": 1, "parent": 0, "text": "하고싶은것", "brush": "skyblue", "dir": "right", "loc": "193.078125 -136"},
					{"key": 11, "parent": 1, "text": "샘플데이터1", "brush": "skyblue", "dir": "right", "loc": "349.078125 -214"},
					{"key": 12, "parent": 1, "text": "샘플데이터2", "brush": "skyblue", "dir": "right", "loc": "360.078125 -97"},
					{"key": 2, "parent": 0, "text": "필요한것", "brush": "darkseagreen", "dir": "right", "loc": "175.078125 125"},
					{"key": 21, "parent": 2, "text": "샘플데이터1", "brush": "darkseagreen", "dir": "right", "loc": "315.078125 75.5"},
					{"key": 22, "parent": 2, "text": "샘플데이터2", "brush": "darkseagreen", "dir": "right", "loc": "317.078125 195.5"},
					{"key": 3, "parent": 0, "text": "가고싶은곳", "brush": "palevioletred", "dir": "left", "loc": "-145 -133.75"},
					{"key": 31, "parent": 3, "text": "샘플데이터1", "brush": "palevioletred", "dir": "left", "loc": "-245 -186.75"},
					{"key": 32, "parent": 3, "text": "샘플데이터2", "brush": "palevioletred", "dir": "left", "loc": "-258 -37.75"},
					{"key": 4, "parent": 0, "text": "보고싶은것", "brush": "coral", "dir": "left", "loc": "-127 175.75"},
					{"key": 41, "parent": 4, "text": "샘플데이터1", "brush": "coral", "dir": "left", "loc": "-212 130.25"},
					{"key": 42, "parent": 4, "text": "샘플데이터2", "brush": "coral", "dir": "left", "loc": "-212 195.25"},
				]
			};

			$("#mySavedModel").text(JSON.stringify(mindmapData)); // 사용할 데이터 넣어주기
		}

		// ----------------------- 변경사항 db에 반영 -----------------------
		function updateMindmapList(){
			let mindmapJson = JSON.parse(myDiagram.model.toJson());
			let mindmapList = mindmapJson["nodeDataArray"];
			// console.log(mindmapList);

			$.ajax({
				type: "POST",
				url:"mupdate.pl",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(mindmapList),
				success:function(result){
					console.log(result);
					if(result === "success"){
						alert("성공적으로 마인드맵을 저장하였습니다.");
					}else {
						alert("마인드맨 저장실패.");
					}
				}, error:function(){
					console.log("updateMindmapList() -  ajax 통신 실패");
				}
			})

		}

	</script>

	<!-- ----------------------------------- 마인드맵 라이브러리 (gojs) -------------------------------------- -->
	<script id="code">

		function init() {
	  
		  myDiagram = new go.Diagram('myDiagramDiv', {
			// when the user drags a node, also move/copy/delete the whole subtree starting with that node
			'commandHandler.copiesTree': true,
			'commandHandler.copiesParentKey': true,
			'commandHandler.deletesTree': true,
			'draggingTool.dragsTree': true,
			'undoManager.isEnabled': true
		  });
	  
		  // when the document is modified, add a "*" to the title and enable the "Save" button
		  myDiagram.addDiagramListener('Modified', (e) => {
			var button = document.getElementById('SaveButton');
			if (button) button.disabled = !myDiagram.isModified;
			var idx = document.title.indexOf('*');
			if (myDiagram.isModified) {
			  if (idx < 0) document.title += '*';
			} else {
			  if (idx >= 0) document.title = document.title.slice(0, idx);
			}
		  });
	  
		  // a node consists of some text with a line shape underneath
		  myDiagram.nodeTemplate = new go.Node('Vertical', { selectionObjectName: 'TEXT' })
			// remember the locations of each node in the node data
			.bindTwoWay('location', 'loc', go.Point.parse, go.Point.stringify)
			// make sure text "grows" in the desired direction
			.bind('locationSpot', 'dir', (d) => spotConverter(d, false))
			.add(
			  new go.TextBlock({
				name: 'TEXT',
				minSize: new go.Size(30, 15),
				editable: true
			  })
				.bindTwoWay('text')
				.bindTwoWay('scale')
				.bindTwoWay('font'),
			  new go.Shape('LineH', {
				stretch: go.Stretch.Horizontal,
				strokeWidth: 3,
				height: 3,
				// this line shape is the port -- what links connect with
				portId: '',
				fromSpot: go.Spot.LeftRightSides,
				toSpot: go.Spot.LeftRightSides
			  })
				.bind('stroke', 'brush')
				// make sure links come in from the proper direction and go out appropriately
				.bind('fromSpot', 'dir', (d) => spotConverter(d, true))
				.bind('toSpot', 'dir', (d) => spotConverter(d, false))
			);
	  
		  // selected nodes show a button for adding children
		  myDiagram.nodeTemplate.selectionAdornmentTemplate = new go.Adornment('Spot')
			.add(
			  new go.Panel('Auto')
				.add(
				  // this Adornment has a rectangular blue Shape around the selected node
				  new go.Shape({
					fill: null,
					stroke: 'dodgerblue',
					strokeWidth: 3
				  }),
				  new go.Placeholder({ margin: new go.Margin(4, 4, 0, 4) })
				),
			  // and this Adornment has a Button to the right of the selected node
			  go.GraphObject.build('Button', {
				alignment: go.Spot.Right,
				alignmentFocus: go.Spot.Left,
				click: addNodeAndLink // define click behavior for this Button in the Adornment
			  })
				.add( // the Button content
				  new go.TextBlock('+', { font: 'bold 8pt sans-serif' })
				)
			);
	  
		  // the context menu allows users to change the font size and weight,
		  // and to perform a limited tree layout starting at that node
		  myDiagram.nodeTemplate.contextMenu = go.GraphObject.build('ContextMenu')
			.add(
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Bigger', { click: (e, obj) => changeTextSize(obj, 1.1) })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Smaller', { click: (e, obj) => changeTextSize(obj, 1 / 1.1) })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Bold/Normal', { click: (e, obj) => toggleTextWeight(obj) })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Copy', { click: (e, obj) => e.diagram.commandHandler.copySelection() })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Delete', { click: (e, obj) => e.diagram.commandHandler.deleteSelection() })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Undo', { click: (e, obj) => e.diagram.commandHandler.undo() })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Redo', { click: (e, obj) => e.diagram.commandHandler.redo() })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Layout', {
					click: (e, obj) => {
					  var adorn = obj.part;
					  adorn.diagram.startTransaction('Subtree Layout');
					  layoutTree(adorn.adornedPart);
					  adorn.diagram.commitTransaction('Subtree Layout');
					}
				  })
				)
			);
	  
		  // a link is just a Bezier-curved line of the same color as the node to which it is connected
		  myDiagram.linkTemplate = new go.Link({
			curve: go.Curve.Bezier,
			fromShortLength: -2,
			toShortLength: -2,
			selectable: false
		  })
			.add(
			  new go.Shape({ strokeWidth: 3 })
				.bindObject('stroke', 'toNode', (n) => {
				  if (n.data.brush) return n.data.brush;
				  return 'black';
				})
			);
	  
		  // the Diagram's context menu just displays commands for general functionality
		  myDiagram.contextMenu = go.GraphObject.build('ContextMenu')
			.add(
			  go.GraphObject.build('ContextMenuButton', {
				  click: (e, obj) => e.diagram.commandHandler.pasteSelection(e.diagram.toolManager.contextMenuTool.mouseDownPoint)
				})
				.bindObject('visible', '',
				  (o) => {
					return o.diagram && o.diagram.commandHandler.canPasteSelection(o.diagram.toolManager.contextMenuTool.mouseDownPoint)
				  }
				)
				.add(
				  new go.TextBlock('Paste')
				),
			  go.GraphObject.build('ContextMenuButton', {
				  click: (e, obj) => e.diagram.commandHandler.undo()
				})
				.bindObject('visible', '', (o) => o.diagram && o.diagram.commandHandler.canUndo())
				.add(
				  new go.TextBlock('Undo')
				),
			  go.GraphObject.build('ContextMenuButton', {
				  click: (e, obj) => e.diagram.commandHandler.redo()
				})
				.bindObject('visible', '', (o) => o.diagram && o.diagram.commandHandler.canRedo())
				.add(
				  new go.TextBlock('Redo')
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Save', { click: (e, obj) => save() })
				),
			  go.GraphObject.build('ContextMenuButton')
				.add(
				  new go.TextBlock('Load', { click: (e, obj) => load() })
				)
			);
	  
		  myDiagram.addDiagramListener('SelectionMoved', (e) => {
			var rootX = myDiagram.findNodeForKey(0).location.x;
			myDiagram.selection.each((node) => {
			  if (node.data.parent !== 0) return; // Only consider nodes connected to the root
			  var nodeX = node.location.x;
			  if (rootX < nodeX && node.data.dir !== 'right') {
				updateNodeDirection(node, 'right');
			  } else if (rootX > nodeX && node.data.dir !== 'left') {
				updateNodeDirection(node, 'left');
			  }
			  layoutTree(node);
			});
		  });

		  // read in the predefined graph using the JSON format data held in the "mySavedModel" textarea
		  load();
		}
	  
		function spotConverter(dir, from) {
		  if (dir === 'left') {
			return from ? go.Spot.Left : go.Spot.Right;
		  } else {
			return from ? go.Spot.Right : go.Spot.Left;
		  }
		}
	  
		function changeTextSize(obj, factor) {
		  var adorn = obj.part;
		  adorn.diagram.startTransaction('Change Text Size');
		  var node = adorn.adornedPart;
		  var tb = node.findObject('TEXT');
		  tb.scale *= factor;
		  adorn.diagram.commitTransaction('Change Text Size');
		}
	  
		function toggleTextWeight(obj) {
		  var adorn = obj.part;
		  adorn.diagram.startTransaction('Change Text Weight');
		  var node = adorn.adornedPart;
		  var tb = node.findObject('TEXT');
		  // assume "bold" is at the start of the font specifier
		  var idx = tb.font.indexOf('bold');
		  if (idx < 0) {
			tb.font = 'bold ' + tb.font;
		  } else {
			tb.font = tb.font.slice(idx + 5);
		  }
		  adorn.diagram.commitTransaction('Change Text Weight');
		}
	  
		function updateNodeDirection(node, dir) {
		  myDiagram.model.setDataProperty(node.data, 'dir', dir);
		  // recursively update the direction of the child nodes
		  var chl = node.findTreeChildrenNodes(); // gives us an iterator of the child nodes related to this particular node
		  while (chl.next()) {
			updateNodeDirection(chl.value, dir);
		  }
		}
	  
		function addNodeAndLink(e, obj) {
		  var adorn = obj.part;
		  var diagram = adorn.diagram;
		  diagram.startTransaction('Add Node');
		  var oldnode = adorn.adornedPart;
		  var olddata = oldnode.data;
		  // copy the brush and direction to the new node data
		  var newdata = { text: 'idea', brush: olddata.brush, dir: olddata.dir, parent: olddata.key };
		  diagram.model.addNodeData(newdata);
		  layoutTree(oldnode);
		  diagram.commitTransaction('Add Node');
	  
		  // if the new node is off-screen, scroll the diagram to show the new node
		  var newnode = diagram.findNodeForData(newdata);
		  if (newnode !== null) diagram.scrollToRect(newnode.actualBounds);
		}
	  
		function layoutTree(node) {
		  if (node.isTreeRoot) {  // is this a root node?
			// adding to the root?
			layoutAll(); // lay out everything
		  } else {
			// otherwise lay out only the subtree starting at this parent node
			var parts = node.findTreeParts();
			layoutAngle(parts, node.data.dir === 'left' ? 180 : 0);
		  }
		}
	  
		function layoutAngle(parts, angle) {
		  var layout = new go.TreeLayout({
			angle: angle,
			arrangement: go.TreeArrangement.FixedRoots,
			nodeSpacing: 5,
			layerSpacing: 20,
			setsPortSpot: false, // don't set port spots since we're managing them with our spotConverter function
			setsChildPortSpot: false
		  });
		  layout.doLayout(parts);
		}
	  
		function layoutAll() {
		  var root = myDiagram.findTreeRoots().first();
		  if (root === null) return;
		  myDiagram.startTransaction('Layout');
		  // split the nodes and links into two collections
		  var rightward = new go.Set(/*go.Part*/);
		  var leftward = new go.Set(/*go.Part*/);
		  root.findLinksConnected().each((link) => {
			var child = link.toNode;
			if (child.data.dir === 'left') {
			  leftward.add(root); // the root node is in both collections
			  leftward.add(link);
			  leftward.addAll(child.findTreeParts());
			} else {
			  rightward.add(root); // the root node is in both collections
			  rightward.add(link);
			  rightward.addAll(child.findTreeParts());
			}
		  });
		  // do one layout and then the other without moving the shared root node
		  layoutAngle(rightward, 0);
		  layoutAngle(leftward, 180);
		  myDiagram.commitTransaction('Layout');
		}
	  
		// Show the diagram's model in JSON format
		function save() {
		  document.getElementById('mySavedModel').value = myDiagram.model.toJson();
		  myDiagram.isModified = false;
		  updateMindmapList(); // 추가함. 기존 라이브러리 코드아님! -> 우리 db에 업데이트용
		}
		function load() {
		  myDiagram.model = go.Model.fromJson(document.getElementById('mySavedModel').value);
		  // if any nodes don't have locations assigned from the model, force a layout of everything
		  if (myDiagram.nodes.any(n => !n.location.isReal())) layoutAll();
		}

		//window.addEventListener('DOMContentLoaded', init);
	</script>
</body>
</html>