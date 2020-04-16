import requests
from libs.wrapitup import WrapItUp

insertQuery = 'REPLACE INTO players (steamid64, name, kills, deaths, suicides, sleepers, wolfs, bears, beartrap, bleed, landmine) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);'

def GrabRustNorthData():
	rawData = requests.get('http://redacted:8888/getPlayersGlobalStats')
	if rawData.status_code != 200:
		return

	refinedData = rawData.json()

	db = WrapItUp(username='redacted', password='redacted', ip='redacted', database='redacted')

	for row in refinedData['players']:
		db.Query(insertQuery, [row["idPlayer"], row["playerName"], row["kills"], row["players"], row["suicides"], row["sleepers"], row["wolf"], row["bear"], row["bearTrap"], row["bleedings"], row["landmine"]])

	db.Close()


if __name__ == '__main__':
	GrabRustNorthData()

