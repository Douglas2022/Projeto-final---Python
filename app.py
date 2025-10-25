from flask import Flask, render_template, request
import mysql.connector as my

app = Flask(__name__)

def ConectarBanco():
    conexao = my.connect(
        user='user',
        password='1234',
        database='SuperSelectD',
        host='host'
    )
    return conexao

@app.route('/', methods=['GET', 'POST'])
def index():
    pass


@app.route('/cadastro', methods=['GET', 'POST'])
def Cadastro():
    titulo = 'Página Inicial'
    resultado = None
    email = senha = None

    if request.method == 'POST': 
        email = request.form.get('email')
        senha = request.form.get('senha')
        print(f'Email: {email}, Senha: {senha}')

        conexao = ConectarBanco()
        cursor = conexao.cursor(dictionary=True)
        sql = 'SELECT * FROM usuarios WHERE email = %s'
        cursor.execute(sql, (email,))  
        resultado = cursor.fetchone()
        cursor.close()
        conexao.close()

        if resultado:
            if senha == resultado['senha']:
                if resultado['tipo'] == 'cliente':
                    return render_template('cliente.html', usuarios=resultado)
                elif resultado['tipo'] == 'administrador':
                    return render_template('administrador.html', usuarios=resultado)
                else:
                    return render_template('index.html', titulo=titulo, mensagem='Tipo de usuário desconhecido.')
            else:
                return render_template('index.html', titulo=titulo, mensagem='Senha incorreta.')
        else:
            return render_template('index.html', titulo=titulo, mensagem='Email não encontrado.')

   
    return render_template('index.html', titulo=titulo)

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
