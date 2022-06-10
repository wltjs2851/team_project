/**
 * 
 */

	
//    한달짜리만 할때는 이렇게 하면됨
// Date 포맷 
const dateFormat = (date) => {
    return date.toLocaleDateString().replace(/\./g, "").split(" ");
  }
  
  // 달력 생성
  const makeCalendar = (date) => {
	  
//	  const date = new Date();
	var currentYear = date.getFullYear();
	var currentMonth = date.getMonth() + 1;
	var thisday = currentYear + '/' + currentMonth + '/';
	    
//	var realToday = new Date.getFullYear() + '/' + new Date.getMonth() + 1 + '/' + new Date.getDate();
    
    // 현재의 년도와 월 받아오기
    const [nowYear, nowMonth] = dateFormat(date);

    // 지난달의 마지막 요일
    const prevDay = new Date(nowYear, nowMonth - 1, 1).getDay();

    // 현재 월의 마지막 날 구하기
    const lastDay = dateFormat(new Date(nowYear, nowMonth, 0)).pop() * 1;
    
    const today = new Date().getDate();
    
    let htmlDummy = '';

    // 전달 날짜 표시하기
    for (let i = 0; i < prevDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    // 현재 날짜 표시하기
    for (let i = 1; i <= lastDay; i++) {
    	  htmlDummy += `<div class='divDate' data-today='${currentYear + "/" + currentMonth + "/" + i}'>${i}</div>`;
    }
    
    

    // 지금까지 추가한 날짜 박스
    const maxDay = prevDay + lastDay;

    // 마지막날이 들어있는 열에 남은 박스 채우기
    const nextDay = (Math.ceil(maxDay / 7) * 7) - maxDay;

    // 다음달 날짜
    for (let i = 0; i < nextDay; i++) {
      htmlDummy += `<div class="noColor"></div>`;
    }

    document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
    document.querySelector(`.dateTitle`).innerText = `${nowYear}년 ${nowMonth}월`;
    
  }
  
  var date = new Date();
  var currentYear = date.getFullYear();
  var currentMonth = date.getMonth() + 1;
  var thisday = currentYear + '/' + currentMonth + '/';
  
  // Date 객체를 보내서 달력 생성
  makeCalendar(date);
  
  
  // 이전달 이동
  document.querySelector("#prevMonth").onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
  }
  
  // 다음달 이동
  document.querySelector("#nextMonth").onclick = () => {
    makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
  }