from flask import Flask, request, render_template
import numpy as np
import pickle as pickle
import joblib

app = Flask(__name__)

#model = joblib.load('classifier.pkl')
model = pickle.load(open('model.pkl','rb'))


@app.route('/', methods=['GET'])
def home():
     #features = [[32, 71]]
     #int_features = [float(x) for x in request.form.values()]
     #features = [np.array(int_features)]
     #print(features)
     #predictions = model.predict(features)
     #print(predictions)

     return render_template('index.html')

@app.route('/results', methods=['POST'])

def results(): 
     if request.method == 'POST':
          
          features = [[float(request.form["temp"]),float(request.form["humidity"])]]
          
          #features = [[32, 71]]
          print(request.form["temp"])
          print(request.form["humidity"])
          #int_features = [float(x) for x in request.form.values()]
          #features = [np.array(int_features)]
          #print(features)
          predictions = model.predict(features)
          snowing = ""
          print(predictions)
          if predictions[0] == 0:
               snowing = "not snowing!"
          elif predictions[0] == 1:
               snowing = "SNOWING!"
          predictions_text='It is... {}'.format(snowing)
          #print(predictions_text)

          return render_template('results.html', predictions_text='It is {}'.format(snowing))

@app.route('/viz')
def viz():
     return render_template('viz.html')

if __name__ == '__main__':
     app.run(debug=True)
     #app.run(port=8080)