	% from bottle import url
	% include('templates/header.tpl')
	%
	%	monitorStatus = 'UNKNOWN'
	%	if uptimeData == 2:
	%		monitorStatus = '<span id="statusUp">UP</span>'
	%	else:
	%		monitorStatus = '<span id="statusDown">DOWN</span>'	
	%	end 
	%	

	</head>
	<body>
		<div class="mainPanel">
			<h1>Rust North is {{!monitorStatus}}</h1>
		</div>

		<div class="mainPanel">
			<h2>Next Reset: 7th April</h2>
		</div>


	% include('templates/playerdata.tpl')


	</body>

</html>