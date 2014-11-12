\name{setD}
\alias{setD}
\title{
setD: Determining the optimal number of objects per treatment
}
\description{
 "setD" estimates the minimal sample size given the users 
 precision requirements including  
 the accepted errors of the first and second type.
}
\usage{
setD(nmax, SL.p, immunity.p = 0, risk.type = 2, 
     target.EC.p = 10, plot = FALSE, alpha.p = 5, 
     beta.p = 20, print.result = "02.sample size.txt")
}
\arguments{
  \item{nmax}{
 maximum available number of 
 organisms that can be tested per treatment. The calculation of the 
 optimal number will 
 only be done if this number is high enough to generate the response of 
 at least one organism under control conditions (nmax*SL.p > 1). 
 Otherwise a warning message is issued.
}
  \item{SL.p}{
 spontaneous lethality in percent. The function "spoD" can be
 used to calculate SL.p from own experimental data.
}
  \item{immunity.p}{
 Immunity in percent. A population of biological objects might contain a 
 subpopulation which shows no reaction at all (is immune). immunity.p gives 
 the size of the subpopulation in percent of total population size.
 The concentration-response curve always has [100\% - IY] as maximum. 
 EC values are affected by immunity.p only if risktype=3 is used.
}
  \item{risk.type}{
 Choose one of (1,2,3) to select a risk type (see reference for more detail): 

   1: Total risk (TR): The total risk is the total response expressed 
                       as percentage of affected biological units among all 
                       treated units. Spontaneous lethality and immunity are 
                       ignored. 

   2: Added risk (AR): The reference frame is restricted below and above 
                       by spontaneous lethality (SL) and immunity (IY). 
                       Only the response above the SL is considered as an 
                       effect. Using AR, the total response associated 
                       with a target effect of size xx and a spontaneous 
                       lethality SL is xx + SL. 

   3: Extra risk (ER): The reference frame is the interval from SL to 
                       (100\%-IY).  Using ER, the total response associated 
                       with a target effect of size xx is 
                       SL + 0.01 * xx * (100\%-SL-IY).
}
  \item{target.EC.p}{
 The target response in percent (e.g. 10\% to calculate 
 EC10). Only a single value is allowed. Note that the interpretation 
 of target.EC depends on the risktype setting.
}
  \item{plot}{
 There are three possibilities: 

   plot = FALSE:   no plots.

   plot ="single": Creates one plot showing the distributions under no 
                   treatment and under treated conditions with the 
                   optimal number of cases. Additionally, the actual 
                   rates of the type I and type II error are given. 

   plot ="all":    In addition to the "single" plot this option provides 
                   a sample size estimation for all possible target values. 
                   This gives an impression which possibilities of detection 
                   exist under the chosen conditions.  This option may need a 
                   lot of computer capacity and time. It should not be 
                   activated in general.
}
  \item{alpha.p}{
 alpha & beta: size of the type I and type II in percent. 
 The default global settings for alpha and beta are alpha = 5 percent and 
 beta = 20 percent. Increasing the default error rates is not recommended.
 The accepted error rates are global parameters and affect all 
 calculations.
}
  \item{beta.p}{
   see alpha.p
}
\item{print.result}{If omitted, the result is written to 
                       "02.sample size.txt" in the calling directory,
                       if a file name is given, the result is written to that
                       file, if FALSE, nothing is written 
}
}
\value{
\item{number.organisms }{sample size per treatment, substance and run }
\item{spontaneous.lethality }{assumed spontaneous lethality in \%}
\item{immunity  }{assumed immunity in \%}
\item{delta.to.zero }{total response (= \code{target.EC} + 
                         \code{spontaneous.lethality})  }
\item{risk.type}{risk type, see arguments}
\item{target.EC}{the target response in percent}
\item{exact.alpha }{exact alpha error when testing H0: p(response) = 
                    \code{spontaneous.lethality}, given the parameters 
                    assumed and
                    number of organisms = \code{number.organisms } }
\item{exact.beta }{exact beta error, given the parameters assumed and
                    number of organisms = \code{number.organisms } }
}
\references{
 Optimal test design for binary response data: 
  the example of the Fish Embryo Toxicity Test.  Submitted.
}
\author{
Nadia Keddig & Werner Wosniok
}
\examples{
 # sample size calculation per treatment and experimental run
 setD(nmax=350,SL.p=5.5,immunity.p=0,risk.type=2,target.EC=10,
      alpha.p=5,beta.p=20,plot="single")
 setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE")
 setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE",print.result="setD.txt")
 setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE",print.result=FALSE)
}
\keyword{ design }

