<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Rajasri DRS</title>
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
	<link rel="stylesheet" href="css/all.css">
</head>
<!--Design Prepared by Rajasri Systems-->   
<body>
<div id="wrapper">
	<div id="header">
		<a href="http://www.rajasri.net/" class="inner-logo"><img src="img/rajasri.jpeg" alt=""/></a>
	<ul id="top-navigation">
			
			<li {if $activePage eq '1'}class="active"{/if}><a href="controlpanel.php" class="navigation_link">Homepage</a></li>
			<li {if $activePage eq '2'}class="active"{/if}><a href="rating.php" class="navigation_link">Rating</a></li>
			<li {if $activePage eq '3'}class="active"{/if}><a href="report.php" class="navigation_link">Reports</a></li>
			<li><a href="logout.php" class="navigation_link">Logout</a></li>
	</ul>
	</div>
</div>
</body>
</html>
