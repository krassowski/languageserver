% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workspace.R
\docType{data}
\name{Workspace}
\alias{Workspace}
\title{A data structure for a session workspace}
\format{An object of class \code{R6ClassGenerator} of length 25.}
\usage{
Workspace
}
\description{
A \code{Workspace} is initialized at the start of a session, when the language
server is started. Its goal is to contain the \code{Namespace}s of the packages
that are loaded during the session for quick reference.
}
\keyword{internal}
