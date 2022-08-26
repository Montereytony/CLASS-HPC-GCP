#helm install --name xzhang-mysql --set mysqlRootPassword=MySQL_XZhang,mysqlUser=mysql,mysqlPassword=xzhang,mysqlDatabase=xzhang,persistence.existingClaim=xzhang-pvc stable/mysql

helm install --name xzhang-mysql --set mysqlRootPassword=MySQL_XZhang,mysqlUser=mysql,mysqlPassword=xzhang-password,mysqlDatabase=xzhangdb,persistence.existingClaim=xzhang-pvc,securityContext.fsGroup=1003,securityContext.runAsUser=2001 stable/mariadb  
