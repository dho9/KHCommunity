$(function(){
    var accordionButton = $('.list .items > .a_title');
    accordionButton.on('click', function(e){
        e.preventDefault();
        var $this = $(this);
        var target = $this.parent();
        var description = $this.siblings('.a_content');
        var other = target.siblings('.items');
        var otherDescription = other.find('.a_content');
        accordionToggle(target, description, other, otherDescription);
    });
    function accordionToggle(target, description, other, otherDescription){
        if (target.hasClass('active')) {
            target.removeClass('active');
            description.stop().slideUp(300);
        } else {
            target.addClass('active');
            description.stop().slideDown(300);
        }
        if (other && otherDescription) {
            other.removeClass('active');
            otherDescription.stop().slideUp(300);
        }
    };
});

google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart1);

        function drawChart1() {
        var data = google.visualization.arrayToDataTable([
            ['Date', '방문자수', '주문수'],
            ['7/2',  50,      13],
            ['7/3',  43,      14],
            ['7/4',  57,      10],
            ['7/5',  29,      21]
        ]);

        var options = {
            curveType: 'function',
            legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
    }


google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart2);

function drawChart2() {
    var data = google.visualization.arrayToDataTable([
        ['Month', 'Sales'],
        ['4월', 1000],
        ['5월', 1170],
        ['6월', 660],
        ['7월', 1030]
    ]);

    var options = {
        chart: {
            title: '월별 통계(단위:만원)',
            //subtitle: 'Sales, Expenses, and Profit: 2014-2017',
        }
    };

    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
}