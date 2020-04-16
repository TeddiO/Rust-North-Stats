	% if defined('playerData'):

	<div id='playerScores'>
	<h2>Top 100 Players on Rust North</h2>
	<table>
		<thead>
			<tr>
				<th>Name</th><th>Kills</th><th>Deaths (from players)</th><th>Suicides</th><th>Sleepers Murdered</th><th>Death by Wolves</th><th>Death by Bears</th><th>Death by Bear Traps</th><th>Bled Out</th><th>Death by Landmine</th>
			</tr>
		</thead>
		<tbody>
		%for player in playerData:
			<tr><td>{{player[0]}}</td><td>{{player[1]}}</td><td>{{player[2]}}</td><td>{{player[3]}}</td><td>{{player[4]}}</td><td>{{player[5]}}</td><td>{{player[6]}}</td><td>{{player[7]}}</td><td>{{player[8]}}</td><td>{{player[9]}}</td></tr>
		%end
		</tbody>
	</table>
	</div>
	%end