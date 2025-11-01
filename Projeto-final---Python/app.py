from flask import Flask, render_template, request
import mysql.connector as my

app = Flask(__name__)

def ConectarBanco():
    conexao = my.connect(
        user='root',
        password='',
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
        email = request.form.get('email')
        senha = request.form.get('senha')

        conexao = ConectarBanco()
        cursor = conexao.cursor(dictionary=True)
        sql = 'SELECT * FROM usuarios WHERE email=%s AND senha=%s'
        cursor.execute(sql,(email,senha))
        usuarios = cursor.fetchone()
        cursor.close()
        conexao.close()

        if usuarios:
            mensagem = f"Bem - vindo,{usuarios['nome']}"
            print(mensagem)
        else:
            mensagem = f" ou senha incorreta."
            print(mensagem)

    return render_template('login.html')

@app.route('/cadastro', methods=['GET', 'POST'])
def cadastro():
    titulo = 'Página Inicial'
    resultado = None
    email = senha = None

    if request.method == 'POST': 
        nome = request.form.get('nome')

        email = request.form.get('email')
        cpf = request.form.get('cpf')
        senha = request.form.get('senha')
        print(f'Email: {email}, Senha: {senha},nome:{nome},cpf:{cpf}')

#Connectar o banco
        conexao = ConectarBanco()
        cursor= conexao.cursor()
        sql = "INSERT INTO usuarios (nome, email, senha,cpf) VALUES (%s, %s, %s,%s)"
        cursor.execute(sql,(nome,email,senha,cpf))

        conexao.commit()
        cursor.close()
        conexao.close()
   
    return render_template('index.html', titulo=titulo)

@app.route('/cliente', methods=['GET', 'POST'])
def Cliente():
    pass
    return render_template('cliente.html')

    

@app.route('/administrador', methods=['GET', 'POST'])
def Administrador():
    
    pass
    return render_template('administrador.html')

@app.route('/produtos', methods=['GET', 'POST'])
def produtos():
    pass
    return render_template('produtos.html')


@app.route('/comentarios', methods=['GET', 'POST'])
def Comentarios():
    pass
    return render_template('comentarios.html')


@app.route('/historico', methods=['GET'])
def Historico():
    pass
    return render_template('historico.html')


    



if __name__ == '__main__':
    app.run(debug=True)
