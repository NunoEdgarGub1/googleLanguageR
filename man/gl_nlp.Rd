% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/natural-language.R
\name{gl_nlp}
\alias{gl_nlp}
\title{Perform Natural Language Analysis}
\usage{
gl_nlp(string, nlp_type = c("annotateText", "analyzeEntities",
  "analyzeSentiment", "analyzeSyntax", "analyzeEntitySentiment"),
  type = c("PLAIN_TEXT", "HTML"), language = c("en", "zh", "zh-Hant", "fr",
  "de", "it", "ja", "ko", "pt", "es"), encodingType = c("UTF8", "UTF16",
  "UTF32", "NONE"), version = c("v1", "v1beta2"))
}
\arguments{
\item{string}{A vector of text to detect language for, or Google Cloud Storage URI(s)}

\item{nlp_type}{The type of Natural Language Analysis to perform.  The default \code{annotateText} will perform all features in one call.}

\item{type}{Whether input text is plain text or a HTML page}

\item{language}{Language of source, must be supported by API.}

\item{encodingType}{Text encoding that the caller uses to process the output}

\item{version}{the API version}
}
\value{
A list of the following objects, if those fields are asked for via \code{nlp_type}:

\itemize{
 \item{sentences - }{\href{https://cloud.google.com/natural-language/docs/reference/rest/v1/Sentence}{Sentences in the input document}}
 \item{tokens - }{\href{https://cloud.google.com/natural-language/docs/reference/rest/v1/Token}{Tokens, along with their syntactic information, in the input document}}
 \item{entities - }{\href{https://cloud.google.com/natural-language/docs/reference/rest/v1/Entity}{Entities, along with their semantic information, in the input document}}
 \item{documentSentiment - }{\href{https://cloud.google.com/natural-language/docs/reference/rest/v1/Sentiment}{The overall sentiment for the document}}
 \item{language - }{The language of the text, which will be the same as the language specified in the request or, if not specified, the automatically-detected language}
 \item{text - }{The original text passed into the API. \code{NA} if not passed due to being zero-length etc. }
}
}
\description{
Analyse text entities, sentiment, and syntax using the Google Natural Language API
}
\details{
\code{string} can be a character vector, or a location of a file content on Google cloud Storage.
  This URI must be of the form \code{gs://bucket_name/object_name}

Encoding type can usually be left at default \code{UTF8}.
  \href{https://cloud.google.com/natural-language/docs/reference/rest/v1/EncodingType}{Read more here}

The current language support is available \href{https://cloud.google.com/natural-language/docs/languages}{here}
}
\examples{

\dontrun{

text <- "to administer medicince to animals is frequently a very difficult matter,
  and yet sometimes it's necessary to do so"
nlp <- gl_nlp(text)

nlp$sentences

nlp$tokens

nlp$entities

nlp$documentSentiment

## vectorised input
texts <- c("The cat sat one the mat", "oh no it didn't you fool")
nlp_results <- gl_nlp(texts)



}

}
\seealso{
\url{https://cloud.google.com/natural-language/docs/reference/rest/v1/documents}
}
