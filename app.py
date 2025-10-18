from flask import Flask,render_template,request,url_for
import mysql.connector as my

app = Flask(__name__)

def ConnectarBanco():
    conexao  = my.connect(
        user = 'root',
        password = '1234',
        database = 'SuperSelectD',
        host = 'LocalHost'
    )
    return conexao

@app.route('/',methods=['GET','POST'])
def index():
    return render_template('index.html')
    
    
    
if __name__ == '__main__':
    app.run(debug=True)



 


