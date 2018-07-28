# setwd('R:/HDD1/공모전/공모전(공공데이터공모전)')
# (data=read.csv(list.files()[4],stringsAsFactors = F))
# (data2=read.csv(list.files()[5],stringsAsFactors = F))
# # install_version("binman", version = "0.1.0", repos = "https://cran.uni-muenster.de/")
# # install_version("wdman", version = "0.2.2", repos = "https://cran.uni-muenster.de/")
# # install_version("RSelenium", version = "1.7.1", repos = "https://cran.uni-muenster.de/")
# library(DUcj)
# library(RSelenium)
library(rvest);library(httr);library(stringr);library(RCurl)#등등
library(XML)
poli=NULL
for(i in 1:1368){
  url=paste0('http://www.police.go.kr/portal/bbs/list.do?bbsId=B0000043&searchCnd=&searchWrd=&section=&sdate=&edate=&useAt=&replyAt=&menuNo=200575&viewType=&delCode=0&option1=&option2=&option4=&option5=&deptId=&larCdOld=&midCdOld=&smCdOld=&orderType=option1&pageUnit=10&pageIndex=',i)
  url1=getURL(url)
  read_html(url1,'table')%>%html_text()


  url1=getURL(url,encoding='UTF-8')
  Sys.setlocale("LC_ALL", "English")
  del=readHTMLTable(url1,encoding='UTF-8')
  Sys.setlocale("LC_ALL", "")
  (del2=del[[2]])


  line=readLines(url,encoding = 'UTF-8')
  # del3=line[which(str_detect(line,"td"))][str_detect(line[which(str_detect(line,"td"))],'\\p{Hangul}')]
  # gsub('</td>','',gsub('\t\t\t\t\t<td class=\"title\">','',del3[-grep('\t\t\t\t\t\t\t\t',del3)]))
  # gsub('\t','',line[which(str_detect(line,"ellips"))+1])
  url=paste0('https://www.police.go.kr',gsub('" class="ellips">','',gsub('<a href="','',gsub('amp;','',gsub(';jsessionid=NTOpjtuAqRx1A1Fqx63FtHtQHzL7UQ5z00SZAzVhjLErjrcb09YrQjk1yqT58E4Z.cypol-was01_servlet_engine1','',gsub('\t','',line[which(str_detect(line,"ellips"))]))))))
  del3=cbind(del2,url)
  poli=rbind(poli,del3)
}
colnames(poli)<-c('num','name','temper','day','com','veiw','url')
getwd()
# setwd('D:/packages/Q7')
# devtools::use_data(poli, internal = F,overwrite=T)
# devtools::use_data(data, internal = F,overwrite=T)
# devtools::use_data(data2, internal = F,overwrite=T)
