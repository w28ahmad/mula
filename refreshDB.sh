source '.env'
cd mula-store

echo '[LOG] Creation insertion script'
python3 generateInsertQuery.py 

if [[ -z "${DB_HOST}" ]]; then
    echo "[Error] DB_HOST not set" 1>&2
elif [[ -z "${DB_USER}" ]]; then
    echo "[Error] DB_USER not set" 1>&2
elif [[ -z "${DB_PASSWORD}" ]]; then
    echo "[Error] DB_PASSWORD not set" 1>&2
else
    echo '[LOG] Creating DB'
    mysql --password=${DB_PASSWORD} --user=${DB_USER} --host=${DB_HOST} < createQuestionStore.sql 2>&1
    echo '[LOG] Migrating Data'
    mysql --password=${DB_PASSWORD} --user=${DB_USER} --host=${DB_HOST} < insertQuestionStore.sql 2>&1
fi

cd ..