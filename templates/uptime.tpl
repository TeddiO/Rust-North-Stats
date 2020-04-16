	<% 
	from bottle import url

	include('templates/header.tpl')

	statusIcons = {
		"0":'<img src="{0}" alt="Not yet tracking" />'.format(url("images", path="uptime/bullet_black.png")),
		"1":'<img src="{0}" alt="Not checked." />'.format(url("images", path="uptime/bullet_yellow.png")),
		"2":'<img src="{0}" alt="Up." />'.format(url("images", path="uptime/bullet_green.png")),
		"8":'<img src="{0}" alt="Seems to be down..." />'.format(url("images", path="uptime/bullet_orange.png")),
		"9":'<img src="{0}" alt="We seem to be dead bob." />'.format(url("images", path="uptime/bullet_red.png")),
	}

	%>

	<link rel="stylesheet" href= "{{ url('css', path='uptime.css') }}" type="text/css" />
	</head>

	<body>

		<div id="mainUptimePanel" class="glassPanel">

			%if defined('error'):
				<h2>Monitors currently offline.</h2>
			%end

			%if defined('uptimeData'):
			<h2 id="countCheck">Total Monitor count is: {{len(uptimeData)}}</h2>
			<p>All services are tested every 5 minutes.</p>
			<p>Percentiles are the last 30 rolling days.</p>


			<table class="cleanHorizontalTable">
				<thead>
					<th>Server ID</th><th>Status</th><th id="uptimeHeader">Online uptime (99th %)</th>
				</thead>

				<tbody>
				%for item in uptimeData:
				<tr>
					<td>{{!item['friendlyname']}}</td><td>{{!statusIcons[item['status']]}}</td><td id="uptimeBody">{{item['alltimeuptimeratio']}}</td>
				</tr>
				%end

		
				</tbody>
				</table>
			%end
		</div>


	<div id="statusPanel" class="glassPanel">
		<h2>Monitor Information</h2>

		<h3>Server Status</h3>
		<table id="statusInfo"><!-- This should probably be dd / dt, but whatever. -->
			<tr><td>{{!statusIcons['0']}}</td> <td> Not yet tracking or tracking paused</td></tr>
			<tr><td>{{!statusIcons['1']}}</td> <td>In process of checking</td></tr>
			<tr><td>{{!statusIcons['2']}}</td> <td>Online</td></tr>
			<tr><td>{{!statusIcons['8']}}</td> <td>Initially seems to be down, further checks required</td></tr>
			<tr><td>{{!statusIcons['9']}}</td> <td>Yep we're down.</td></tr>
		</table>
	</div>


	% include('templates/footer.tpl')