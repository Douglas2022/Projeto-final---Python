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
    mensagem = None

    if request.method == 'POST':
        cpf = request.form.get('cpf')
        senha = request.form.get('senha')

        conexao = ConectarBanco()
        cursor = conexao.cursor(dictionary=True)
        sql = 'SELECT * FROM usuarios WHERE cpf=%s AND senha=%s'
        cursor.execute(sql,(cpf,senha))
        usuarios = cursor.fetchone()
        cursor.closw()
        conexao.close()

        if usuarios:
            mensagem = f"Bem - vindo,{usuarios['nome']}"
        else:
            mensagem = f"CPF ou senha incorreta."

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
        cpf = request.form.get('cpf')
        senha = request.form.get('senha')
        print(f'Email: {email}, Senha: {senha},nome:{nome}, tipo:{tipo},cpf:{cpf}')

#Connectar o banco
        conexao = ConectarBanco()
        cursor= conexao.cursor(dictionary=True)
        sql = "INSERT INTO usuarios (nome, email, senha,tipo,senha) VALUES (%s, %s, %s,%s, %s)"
        cursor.execute(sql,(nome,email,senha))
        resultado = cursor.fetchone()
        conexao.commit()
        cursor.close()
        conexao.close()
        print(f"{cursor.rowcount} usuário(s) inserido(s) com sucesso!")

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

@app.route('/produtos', methods=['GET', 'POST'])
def Comentarios():
    pass

@app.route('/comentarios', methods=['GET', 'POST'])
def Comentarios():
    pass

@app.route('/historico', methods=['GET'])
def Historico():
    pass
    



if __name__ == '__main__':
    app.run(debug=True)
