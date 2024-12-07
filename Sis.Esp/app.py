from flask import Flask, request, jsonify
from flask_cors import CORS
from pyswip import Prolog
from flask import render_template

app = Flask(__name__)
CORS(app)  # Permite que o frontend acesse a API

prolog = Prolog()
prolog.consult("diagnostico.pl")  # Carrega o arquivo Prolog

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/diagnostico', methods=['POST'])
def diagnosticar():
    try:
        dados = request.get_json()
        erro_informado = dados.get('query', '')  # Captura o erro enviado pela requisição
        print(erro_informado)

        resultado = list(prolog.query(f"erros('{erro_informado}', Solucao)"))

        if resultado:
            # Se o resultado for encontrado, pega a solução
            solucao = resultado[0]['Solucao']
            return jsonify({
                'status': 'success',
                'diagnostico': solucao
            })
        else:
            return jsonify({
                'status': 'not_found',
                'diagnostico': 'Não foi possível determinar um diagnóstico para este problema.'
            })

    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 500

if __name__ == '__main__':
    app.run(debug=True)