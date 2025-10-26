from flask import Flask, render_template, request
import mysql.connector as my

app = Flask(__name__)


def ConectarBanco():
    conexao = my.connect(
        user='root',
        password='12345',
        database='SuperSelectD',
        host='localhost'
    )
    return conexao
try:
    conexao = ConectarBanco()
    print("Conexão OK!")
    conexao.close()
except my.Error as err:
    print(f"Erro ao conectar: {err}")


@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')

@app.route('/login',methods=['GET', 'POST'])
def login():
    return render_template('login.html')



@app.route('/cadastro', methods=['GET', 'POST'])
def cadastro():
    titulo = 'Página Inicial'
    resultado = None
    email = senha = None

    if request.method == 'POST': 
        nome = request.form.get('nome')
        tipo = request.form.get('tipo')
        email = request.form.get('email')
        senha = request.form.get('senha')
        print(f'Email: {email}, Senha: {senha},nome:{nome}, tipo:{tipo}')

#Connectar o banco
        conexao = ConectarBanco()
        cursor= conexao.cursor(dictionary=True)
        sql = 'select * from usuarios where nome = %s and senha = %s'
        cursor.execute(sql,(nome,email,senha))
        resultado = cursor.fetchall()
        cursor.close()
        conexao.close()

        if resultado:
            print('Usuarios encontrado:',resultado)
        else:
            print('Usuarios não encontrado:')
   
    return render_template('cadastro.html', titulo=titulo)

@app.route('/cliente', methods=['GET', 'POST'])
def Cliente():
    pass

@app.route('/administrador', methods=['GET', 'POST'])
def Administrador():
    pass
@app.route('/comentarios', methods=['GET', 'POST'])
def Comentarios():
    pass

@app.route('/historico', methods=['GET'])
def Historico():
    pass
    



if __name__ == '__main__':
    app.run(debug=True)
