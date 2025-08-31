from flask import Flask, render_template
import requests

app = Flask(__name__)


@app.route('/mostrarEndereco', methods = ['GET','POST'])
def mostrarEndereco():

@app.route('/')
def index():
    url = 'https://fakestoreapi.com/products'
    resposta = requests.get(url)
    dados = ''
    
    if resposta.status_code == 200:
        dados = resposta.json()
        print(dados)

    return render_template('todosProdutos.html', dados=dados)


if __name__ == '__main__':
    app.run(debug=True)
