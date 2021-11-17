import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler


def predictions(gre, gpa, undergrad_school_rank):
    model_df = pd.read_csv("./model_db.csv") #switch to connecting through pgadmin on Thursday

    X = model_df[['gre','gpa','undergrad_school_rank']]
    y = model_df['admit']

    X_train, X_test, y_train, y_test = train_test_split(X, y, train_size = 0.8, random_state=1)
    scaler = StandardScaler().fit(X_train)

    X_train_scaled = scaler.transform(X_train)
    X_test_scaled = scaler.transform(X_test)

    classifier = LogisticRegression(class_weight = 'balanced')
    classifier.fit(X_train_scaled, y_train)

    print(f"Training Data Score: {classifier.score(X_train_scaled, y_train)}")
    print(f"Testing Data Score: {classifier.score(X_test_scaled, y_test)}")

    return classifier.predict([[gre, gpa, undergrad_school_rank]])