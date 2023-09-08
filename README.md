# Fine Tuning Pre-Trained Bert Transformer MultiClassClassificatior for the <b>QueryTypeDetector</b>
This jup-notebook prepares, trains and saves a transformer based model (fine tuning a pre-trained distilbert) that will <b>categorize the query</b> into one of the following types:<br>
- 0) <b>Retailer</b>: Query is about a retailer (Target, Walmart, ...)
- 1) <b>Brand</b>: Query is about a specific brand (Huggies, Gatorade, ..)
- 2) <b>Category</b>: Query is about an open category (diapers, hand bags, phones, ...)
The purpose of this model is to direct a query request to the specific treatment depending on the category. The output will be the <b>predicted category</b> and the <b>confidence</b> (in that prediction).

### Notes/Steps
- The <b>data is loaded</b> along with the required libraries (transformers, torch, nltk...), the retailers are in 'offer_retailer.RETAILER', the brands in 'offer_retailer.BRAND' and the categories in 'categories.PRODUCT_CATEGORY and categories.IS_CHILD_CATEGORY_TO'. 
- After <b>cleaning the data</b>, I realize that we need a lot more samples for 'categories', since it is the most 'generic' option and we would benefit from having a wide range of observations to feed the model.
- For this I semi-manually created a 'retail_product_nouns' list of <b>potential 'category related words'</b> and I enhanced that list by adding all synonyms of every word (using wordnet from nltk).
- Then the data was <b>balanced</b> (by upsizing the lower categories via bootstrap) and <b>upscaled</b> (by resampling with repetition on the resulting data)
- After this, the data is <b>tokenized</b> using a pre-trained BERT model (from HuggingFace) and loaded/transformed into a convenient format (torch tensors).
- Then, after a few iterations on parameters, I came up with a configuration that lets the <b>model learn reasonably well</b>.
- Finally, the model is <b>saved</b> for production.

**To run the jupyter lab file that trains the transformer with the exact same operating system, python version and required libraries in 'production' please run the jupyter lab through this Dockerfile:

docker run -p 8080:8080 -v "$(pwd)":/app/notebooks my_jupyter_lab_image
