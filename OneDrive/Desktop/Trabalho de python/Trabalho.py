import mysql.connector as ms
config = {
    'user':'root',
    'password':'1234',
    'host':'localhost',
    'database':'lojadb'
}
conexao = ms.connect(**config)
cursor = conexao.cursor(dictionary = True)

# sql = 'select * from produtos'
# cursor.execute(sql)
# resposta = cursor.fetchall()

def listarProdutos():
    sql = 'select * from produtos'
    cursor.execute(sql)
    resposta = cursor.fetchall()
    # resposta = [{nome,preco,quantidade},{},{},{}]
    for resp in resposta:
        print(f'Nome:{resp['nome']},preco:{resp['preço']},QTD:{resp['quantidade']},Id:{resp['id']}')
        return resposta
    
def atualizarQuantidade(id,quantidade):
   sql = 'update produtos set quantidade = %s where id = %s'
   valores = (quantidade,id)
   cursor.execute(sql,valores)
   conexao.commit()
   print('Atualização realizada com sucesso!')

def buscarProduto(nome):
    sql = 'select * from produtos where nome = %s'
    valores = (nome)
    cursor.execute(sql,valores)
    resposta = cursor.fetchall()
    for resp in resposta:
        print(f'{resp['id']},Nome:{resp['nome']},Preco{resp['preco']},Quantidade{resp['quantidade']}')

class produtos:
    
   
  