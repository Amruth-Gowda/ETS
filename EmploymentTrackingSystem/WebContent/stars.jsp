
<html>
<head>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	<script type="text/javascript">
   		$(function() {    		
			$('input[type=submit]').click(function() {
				$('display_ratings').html('<span class="stars">'+parseFloat($('input[name=amount]').val())+'</span>');
				$('span.stars').stars();
			});    		
			$('input[type=submit]').click();
		});

		$.fn.stars = function() {
			return $(this).each(function() {
				$(this).html($('<span />').width(Math.max(0, (Math.min(5, parseFloat($(this).html())))) * 16));
			});
		}
		function loadstar()
		{
			
			 $("display_ratings").each(function(index, element) 
					   {
				        var v="";
					   v= $(element).attr("val");
					   $(element).html('<span class="stars">'+parseFloat(v)+'</span>');
						
					});
			 $('span.stars').stars();
		}
		
	</script>
	<style type="text/css">
		.stars, .stars span {
			display: block;
			background: url(http://www.ulmanen.fi/stuff/stars.png) 0 -16px repeat-x;
			width: 80px;
			height: 16px;
		}
	
		.stars span {
			background-position: 0 0;
		}
	</style>
</head>
<body onload="loadstar()">
<display_ratings val="2"></display_ratings>
<display_ratings val="4"></display_ratings>
<display_ratings val="5"></display_ratings>
<display_ratings val="2.5"></display_ratings>
<display_ratings val="5"></display_ratings>
<display_ratings val="3.5"></display_ratings>
<display_ratings val="4.5"></display_ratings>
<display_ratings val="4.7"></display_ratings>
</body>
</html>

