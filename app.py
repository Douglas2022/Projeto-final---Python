from flask import Flask,render_template,request,url_for
import mysql.connector as my

app = Flask(__name__)

def ConnectarBanco():
    conexao  = my.connect(
        user = 'hoot'
        password = password,
        database = SuperSelectD
    )
    return conexao


 





