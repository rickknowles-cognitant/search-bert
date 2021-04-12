from main import app, embeddings, data
from flask import request, jsonify

@app.route('/')
@app.route('/healthcheck')
def index():
    return "OK"

def getResultItem(hit):
    return (data[hit[0]], hit[1])

@app.route('/<indexName>/_search', methods=['GET','POST'])
def search(indexName):
    query = (request.args.get('q') or "")
    offset = (request.args.get('offset') or 0)
    limit = (request.args.get('limit') or -1)
    if limit >= 0:
        results = embeddings.search(query, limit)
    else:
        results = embeddings.search(query)
    return jsonify(map(getResultItem, results))
