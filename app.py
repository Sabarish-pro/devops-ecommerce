from flask import Flask, render_template

app = Flask(__name__)

products = [
    {
        "id": 1,
        "name": "Laptop",
        "price": 50000,
        "description": "High-performance laptop for everyday work."
    },
    {
        "id": 2,
        "name": "Mechanical Keyboard",
        "price": 2500,
        "description": "Mechanical keyboard for comfortable typing."
    },
    {
        "id": 3,
        "name": "Wireless Mouse",
        "price": 1200,
        "description": "Wireless mouse with ergonomic design."
    },
    {
        "id": 4,
        "name": "Headphones",
        "price": 3000,
        "description": "Wireless headphones with clear audio."
    }
]


@app.route("/")
def home():
    return render_template("index.html", products=products)

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/products")
def product_list():
    return render_template("products.html", products=products)

@app.route("/product/<int:product_id>")
def product_detail(product_id):

    product = next(
        (p for p in products if p["id"] == product_id),
        None
    )

    if product is None:
        return "Product not found", 404

    return render_template(
        "product.html",
        product=product
    )
@app.route("/health")
def health():
    return "OK"


if __name__ == "__main__":
    app.run(debug=True)
