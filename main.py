import bottle
import requests
from libs.wrapitup import WrapItUp
from bottle import run, route, template, static_file, error
import os

apiKey = os.getenv("API_KEY")


query = 'SELECT t.* FROM (SELECT `name`, kills, deaths, suicides, sleepers, wolfs, bears, beartrap, bleed, landmine FROM players ORDER BY kills DESC) t LIMIT 100;'

@route('/')
def defaultRoute():

	targetURL = 'http://api.uptimerobot.com/getMonitors?apiKey={}&format=json&noJsonCallback=1'.format(apiKey)
	data = requests.get(targetURL)
	jsonData = data.json()

	if 'monitors' not in jsonData:
		return template("templates/uptime", error = True)

	targetData = jsonData['monitors']['monitor']

	status = int(targetData[0]['status'])

	db = WrapItUp(username='redacted', password='redacted', ip='redacted', database='redacted')
	retData = db.Query(query)

	return template("templates/index", uptimeData = status, playerData=retData)



@route('/static/web/:path#.+#', name='web')
def webContent(path):
	return static_file(path, root='static/web')

@route('/static/web/css/:path#.+#', name='css')
def webCSSContent(path):
	return static_file(path, root='static/web/css')

@error(404)
def error404(error):
	return template('templates/404')


if __name__ == '__main__':
	run(host='localhost', port=8080, debug = True, reloader = False)
else:
	app = application = bottle.default_app()
