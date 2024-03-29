% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radiant.R
\name{launcher}
\alias{launcher}
\title{Create a launcher on the desktop for Windows (.bat), Mac (.command), or Linux (.sh)}
\usage{
launcher(
  app = c("radiant", "radiant.data", "radiant.design", "radiant.basics", "radiant.model",
    "radiant.multivariate"),
  port = 4444,
  pdir = Sys.getenv("HOME")
)
}
\arguments{
\item{app}{App to run when the desktop icon is double-clicked ("analytics", "marketing", "quant", or "base"). Default is "analytics"}

\item{port}{Port to use for shiny::runApp (e.g, port = 4444)}

\item{pdir}{Project directory to use. Default is Sys.getenv("HOME")}
}
\description{
Create a launcher on the desktop for Windows (.bat), Mac (.command), or Linux (.sh)
}
\details{
On Windows/Mac/Linux a file named radiant.bat/radiant.command/radiant.sh will be put on the desktop. Double-click the file to launch the specified Radiant app
}
\examples{
\dontrun{
radiant::launcher("radiant.model")
}

}
\seealso{
\code{\link{win_launcher}} to create a shortcut on Windows

\code{\link{mac_launcher}} to create a shortcut on Mac

\code{\link{lin_launcher}} to create a shortcut on Linux
}
