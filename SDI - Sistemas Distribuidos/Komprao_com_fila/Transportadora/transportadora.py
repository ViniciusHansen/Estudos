import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
    host='localhost',
    credentials=pika.PlainCredentials(username="sdi", password="sdi")
))
channel = connection.channel()

channel.queue_declare(queue='maphello')

def callback(ch, method, properties, body):
    mensagem = body.decode("utf-8")
    linhas = mensagem.strip().split('\n')
    if linhas and linhas[0].startswith("Fornecedor:"):
        fornecedor = linhas[0].replace("Fornecedor:", "").strip()
        itens = linhas[1:]
        print(f"Enviando Caminhão para o fornecedor {fornecedor} com os seguintes items:")
        for item in itens:
            print(f"  {item}")
    else:
        print("Mensagem recebida em formato inesperado:", mensagem)

channel.basic_consume(queue='maphello',
                      on_message_callback=callback,
                      auto_ack=True)



print(' [*] Aguardando solicitação de produto.')
channel.start_consuming()
