\name{spoD}
\alias{spoD}
\title{
 spoD: Determine spontaneous response level or the optimal sample size
}
\description{
 The function "spoD" offers two services. 
 In the planning process the number of individuals to test under control 
 conditions is calculated,
 together with a proposal for partitioning the total data set into subgroups
 in order to identify the amount of biological variation between experiments. 
 In the analysis process, the spontaneous lethality together with its 95\% 
 confidence interval and the biological variation are computed from the users 
 data. 
}
\usage{
 spoD(n = 500, SL.p = 5, SLmin = NA, SLmax = NA, 
      bio.sd.p = 2.008, maxCI = 2.5, 
      analysis = FALSE, SLdataset = NA,
      print.result = "01_spontaneous lethality.txt")
}
\arguments{
  \item{n}{
 maximally possible number (integer) of test organisms.
 Limiting this number is necessary to avoid non-essential 
 calculations and thereby save computing time. 
 The program will invite the user to increase the number 
 if the number is not high enough to estimate the SL with 
 the specified precision.
}
  \item{SL.p}{
 A rough guess of the spontaneous 
 lethality (SL) in \%. 
 It is possible to specify SL.p either as single number or as 
 an interval between 0-100\% by using SLmin and SLmax.
 At least SL.p or (SLmin,SLmax) must be specified. 
}
  \item{SLmin}{
 see SL.p
}
  \item{SLmax}{
 see SL.p
}
  \item{bio.sd.p}{
 (optional): an assumption about 
 the biological contribution the standard deviation of the estimated SL
 The default of 2.008\% holds for the Fish Embryo Toxicity test. 
 The optimal number of partitions of the sample under control 
 conditions will be determined using the  
 bio.sd.p specified.
}
  \item{maxCI}{
 the maximally accepted absolute difference 
 in percent between mean SL and its confidence limits. 
 Default: 2.5\%.
}
  \item{analysis}{
 defaults to FALSE, indicating that the function 
 does planning. To analyze an SLdataset as described below, 
 choose analysis=TRUE.
}
  \item{SLdataset}{
 the data frame containing the spontaneous data to analyze. It 
 has columns titled "n" and "bearer". 
 Column "n" contains the total number of observations, column "bearer" 
 contains the number of organisms which are 
 carriers (in the case of FET the counts of dead or lethal malformed eggs). 
 Each row contains the outcome from one experimental run.
}
 \item{print.result}{If omitted, the result is written to 
                       "01_spontaneous lethality.txt" in the calling directory,
                       if a file name is given, the result is written to that
                       file, if FALSE, nothing is written 
}
}
\value{
if analyse=FALSE:
\item{targetSL }{assumed spontaneous lethality in \%, typically close or 
                 identical to \code{SL.p}}
\item{ntarget }{total number of organisms to test, based on the point estimate
                \code{SL.p}}
\item{optnum }{optimal number of separate sub-tests, based on \code{SL.p}}
\item{nopt }{number of organisms per sub-test, based on \code{SL.p}}
\item{maxSL }{spontaneous lethality associated with \code{maxn}}
\item{Intmin }{lower limit of interval for assumed spontaneous lethality}
\item{Intmax }{upper limit of interval for assumed spontaneous lethality}
\item{maxn }{maximal number of organisms to test, if an interval was given
             for the assumed spontaneous lethality}
\item{optmax }{optimal number of separate sub-tests, based on 
                 \code{Int.min,Int.max}}
\item{noptmax }{number of organisms per sub-test, based on 
                 \code{Int.min,Int.max}}

with analyse=TRUE:
\item{SL }{estimated spontaneous lethality in \%}
\item{CIlo }{lower limit of 95\% confidence interval for \code{SL}}
\item{CIup }{upper limit of 95\% confidence interval for \code{SL}}
\item{sdSL }{standard deviation of \code{SL}}
}

\references{
Optimal test design for binary response data: 
   the example of the Fish Embryo Toxicity Test.  Submitted.
}
\author{
Nadia Keddig & Werner Wosniok
}
\examples{

 #spontaneous lethality

  #1a: planning
  spoD(n=600,SL.p=3.5,SLmin=NA,SLmax=NA,bio.sd.p=2.008)
  spoD(n=600,SL.p=NA,SLmin=3,SLmax=4)
  spoD(n=600,SL.p=3.5,SLmin=NA,SLmax=NA,bio.sd.p=2.008,print.result="spoDa.txt")
  spoD(n=600,SL.p=3.5,SLmin=NA,SLmax=NA,bio.sd.p=2.008,print.result=FALSE)

  #1b: analysis
  SLdataset <- data.frame(n=rep(60,times=4),bearer=c(1,5,8,3))
  spoD(analysis=TRUE,SLdataset=SLdataset)
  spoD(analysis=TRUE,SLdataset=SLdataset,print.result="spoDb.txt")
  spoD(analysis=TRUE,SLdataset=SLdataset,print.result=FALSE)
}
\keyword{ design }
