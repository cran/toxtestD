\name{doseD}
\alias{doseD}
\title{
doseD: Construction of an individual dose scheme
}
\description{
 This function calculates optimal concentration points 
 according to the EC target specification, spontaneous lethality (SL), 
 immunity (IY) and the accepted type I and type II error levels.
}
\usage{
doseD(DP, immunity.p = 0, SL.p = 0, target.EC.p = 10, 
      nconc = 8, text = TRUE, risk.type = 2, 
      print.result = "03.dosestrategy.txt")
}
\arguments{
  \item{DP}{
  The results from pretests should be given as a data.frame 
  with the columns "name", "organisms", "death", "concentration" 
  and "unit", which will be needed for the calculations of the 
  dose scheme
}
  \item{immunity.p}{
  Immunity in percent (see also explanation in "spoD")
}
  \item{SL.p}{
  Spontaneous level in percent, calculated from the users experimental 
  data by the function "spoD" 
}
  \item{target.EC.p}{
  Effect of special interest in percent. 
  More than one target may be given for one 
  calculation. Example: if EC5 and EC10 are of special 
  interest, then use target.EC=c(5,10). Corresponding dose 
  points will be allocated around both targets with distances 
  derived from the confidence interval width.
}
  \item{nconc}{
  Number of different concentrations the user is willing to 
  test in the experiment.
}
  \item{text}{
  text=TRUE adds extended information in the plot.
}
  \item{risk.type}{
  Choose one of (1,2,3) to select a risk type (see reference for more detail):
 
   1: Total risk (TR): The total risk is the total response expressed 
                       as percentage of affected biological units among 
                       all treated units. Spontaneous lethality and immunity 
                       are ignored. 

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
}  \item{print.result}{If empty, the result is written to 
                       "03.dosestrategy.txt" in the calling directory,
                       if a file name is given, the result is written to that
                       file, if FALSE, nothing is written 
}
}

\value{A matrix with the recommended dose scheme is returned. It has 
       \code{nconc} rows and contains columns 
       \code{c("concentration","unit","effect")} describing the concentrations 
       in units "unit" for the effect in "effect".
}

\references{
 Optimal test design for binary response data: 
 the example of the Fish Embryo Toxicity Test.  Submitted. 
}
\author{
Nadia Keddig & Werner Wosniok
}

\examples{
 # calculation of an optimal dose scheme
 #  pretest results as dataframe (DP)
  DP <- data.frame(   name=c("neg.control",rep("substance",times=6)),
                      organisms=c(42,41,42,42,38,42,39),
                      death= c(1,3,40,20,12,40,13),
                      concentration=c(0.0,2.0,3.5,4.0,6.0,8.0,6.0),
                      unit=rep("mg/ml",times=7)  )
 # test design
 doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
       nconc=9,text=TRUE,risk.type=1)
 doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
       nconc=9,text=TRUE,risk.type=2)
 doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
       nconc=9,text=TRUE,risk.type=3)
 doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
       nconc=9,text=TRUE,risk.type=3,print.result="doseD4.txt")
 doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
       nconc=9,text=TRUE,risk.type=3,print.result=FALSE)
}
\keyword{ design }