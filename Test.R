wrds <- dbConnect(Postgres(),
                  host='wrds-pgdata.wharton.upenn.edu',
                  port=9737,
                  dbname='wrds',
                  sslmode='require',
                  user='colekrudwig')

res <- dbSendQuery(wrds,"SELECT date,dji FROM djones.djdaily")
data <- dbFetch(res, n = -1)
plot(as.Date(data$date,'%Y-%m-%d'),data$dji,xlab="date",ylab="dji",type='l',col='red')
