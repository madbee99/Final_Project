from flask import Flask, render_template, request
from run_ml import predictions

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route('/predict', methods = ['POST'])
def predict():
    if request.method == "POST":
        print(request.form["gre"])
        gre = float(request.form["gre"])
        gpa = float(request.form["gpa"])
        rank = float(request.form["rank"])

        print(request.form["gpa"])
        print(request.form["rank"])

        #if(gre < 0 or gre >800):
        #    return "Error"

        #data = float(request.form['exp'])
        #print("Data", model.predict([[data]]))
        prediction = predictions(gre, gpa, rank)

        output = prediction[0]

        if(output == 1):
            result_image = "https://wp.dailybruin.com/images/2017/04/web.ns_.bruin_.day_.AL_.jpg"
            result_text = "Congrats! You will probably be admitted!"
        elif(output == 0):
            result_image = "https://www.cambridge.org/elt/blog/wp-content/uploads/2019/07/Sad-Face-Emoji.png"
            result_text = "Uh oh! You will probably be rejected"

        
        print(output)
        return render_template("results.html", result_image = result_image, result_text = result_text)