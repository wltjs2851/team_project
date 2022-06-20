var map;

function Initialization(_map)
{
    map = _map;
}

function DrawPolygon()
{
    $.getJSON("/resources/json/geo5.json", function(geojson)
    {	
        var data = geojson.features;
        var name = '';            //행정구 명
        var code = '';

        $.each(data, function(index, val)
        {
            name = val.properties.SIG_KOR_NM;
            console.log("name: "+ name);
            code = val.properties.CTPRVN_CD;

            if(val.geometry.type == "MultiPolygon")
            {
                displayArea(name, code, val.geometry.coordinates, true);
            }
            else
            {
                displayArea(name, code, val.geometry.coordinates, false);
            }
        });
    });
}

function makePolygon(coordinates)
{
    var polygonPath = []; 

    $.each(coordinates[0], function(index, coordinate) 
    {
        polygonPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
    });

    return new kakao.maps.Polygon({
        path:polygonPath, 
        strokeWeight: 1,
        strokeColor: '#004c80', 
        strokeOpacity: 0.8, 
        strokeStyle: 'longdash', 
        fillColor: '#A2FF99', 
        fillOpacity: 0.2 
    });
}


function makeMultiPolygon(coordinates)
{
    var polygonPath = []; 

    $.each(coordinates, function(index, val2)
    {
        var coordinates2 = [];

        $.each(val2[0], function(index2, coordinate) 
        {
            coordinates2.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
        });

        polygonPath.push(coordinates2);
    });

    return new kakao.maps.Polygon({
        path:polygonPath,
        strokeWeight: 1,
        strokeColor: '#004c80',
        strokeOpacity: 0.8, 
        strokeStyle: 'longdash',
        fillColor: '#A2FF99', 
        fillOpacity: 0.2 
    });
}


// params : 행정구 명, 도로명 코드, 좌표, 멀티폴리곤 유무
function displayArea(name, code, coordinates, multi)
{
    var polygon;
    if(multi)
    {
        polygon = makeMultiPolygon(coordinates);
    }
    else
    {
        polygon = makePolygon(coordinates);
    }
    
    polygon.setMap(map);
    
    var mouseoverOption = {
			fillColor : '#EFFFED', // 채우기 색깔입니다
			fillOpacity : 0.8
		// 채우기 불투명도 입니다        
		};

		// 다각형에 마우스아웃 이벤트가 발생했을 때 변경할 채우기 옵션입니다
	var mouseoutOption = {
		fillColor : '#A2FF99', // 채우기 색깔입니다
		fillOpacity : 0.2
	// 채우기 불투명도 입니다
	};

	// 다각형에 마우스오버 이벤트를 등록합니다
	kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {

		// 다각형의 채우기 옵션을 변경합니다
//		polygon.setOptions(mouseoverOption);
		customOverlay.setContent('<div class="area" style="background-color:white;">' + name +  '</div>');
		
		customOverlay.setPosition(mouseEvent.latLng);
		customOverlay.setMap(map);

	});

//	kakao.maps.event.addListener(polygon, 'mouseout', function() {
//
//		// 다각형의 채우기 옵션을 변경합니다
//		polygon.setOptions(mouseoutOption);
//		customOverlay.setMap(null);
//	});
	
	var click = 0;

	kakao.maps.event.addListener(polygon, 'mousedown', function() {
		console.log(event);
		console.log('다각형에 mousedown 이벤트가 발생했습니다!');
//		if(click == 0) {
//			click = 1;
//			clickevent(click);
//		} else {
//			click = 0;
//			clickevent(click);
//		}
		
	});
	
	kakao.maps.event.addListener(polygon, 'click', function() {
        
        // 현재 지도 레벨에서 2레벨 확대한 레벨
        var level = map.getLevel()-2;
        
        // 지도를 클릭된 폴리곤의 중앙 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: centroid(points), animate: {
            duration: 350            //확대 애니메이션 시간
        }});            
 
        deletePolygon(polygons);                    //폴리곤 제거      
    });
	
	function clickevent(click) {		
		if(click == 1) {
			polygon.setOptions(mouseoverOption);
			console.log('click 1');
		} else {
			polygon.setOptions(mouseoutOption);
		}
	}
	
}