// Copyright 2015 Openprovider Authors. All rights reserved.
// Use of this source code is governed by a license
// that can be found in the LICENSE file.

package storage

import (
	"fmt"
	"strconv"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)

// MysqlRecord - standard record (struct) for mysql storage package
type MysqlRecord struct {
	Host     string
	Port     int
	Username string
	Password string
	DataBase string
	Table    string
}

// Search data in the storage
func (mysql *MysqlRecord) Search(name string, query string) (map[string][]string, error) {
	result, err := mysql.searchRaw(mysql.Table, name, query)
	if err != nil {
		return nil, err
	}
	if len(result) > 0 {
		return result[0], nil
	}

	data := make(map[string][]string) // empty result
	return data, nil
}

// SearchRelated - search data in the storage from related type or table
func (mysql *MysqlRecord) SearchRelated(
	typeTable string, name string, query string) (map[string][]string, error) {

	result, err := mysql.searchRaw(typeTable, name, query)
	if err != nil {
		return nil, err
	}
	if len(result) > 0 {
		return result[0], nil
	}

	data := make(map[string][]string)
	return data, nil
}

// SearchMultiple - search multiple records of data in the storage
func (mysql *MysqlRecord) SearchMultiple(
	typeTable string, name string, query string) (map[string][]string, error) {

	result, err := mysql.searchRaw(typeTable, name, query)
	if err != nil {
		return nil, err
	}

	data := make(map[string][]string)

	if len(result) > 0 {
		for _, item := range result {
			for key, value := range item {
				data[key] = append(data[key], value...)
			}
		}
		return data, nil
	}

	return data, nil
}

func (mysql *MysqlRecord) searchRaw(typeTable string, name string, query string) ([]map[string][]string, error) {
	// Thanks to https://github.com/go-sql-driver/mysql/wiki/Examples#rawbytes
	db, err := sql.Open("mysql",	mysql.Username + ":" + mysql.Password +
					"@tcp(" + mysql.Host + ":" + strconv.Itoa(mysql.Port) + ")/" +
					mysql.DataBase + "?charset=utf8")

	if err != nil {
		return nil, fmt.Errorf("Mysql connection error: %v", err)
	}
	defer db.Close()

	// Execute the query
	rows, err := db.Query("SELECT * FROM " + typeTable + " where " + name + "=?", query) // TODO: prevent sqli
	if err != nil {
		return nil, fmt.Errorf("Mysql query error: %v", err)
	}

	// Get column names
	columns, err := rows.Columns()
	if err != nil {
		return nil, fmt.Errorf("Mysql column name query error: %v", err)
	}

	// Make a slice for the values
	values := make([]sql.RawBytes, len(columns))

	// rows.Scan wants '[]interface{}' as an argument, so we must copy the
	// references into such a slice
	// See http://code.google.com/p/go-wiki/wiki/InterfaceSlice for details
	scanArgs := make([]interface{}, len(values))
	for i := range values {
		scanArgs[i] = &values[i]
	}

	// Fetch rows
	var data []map[string][]string
	for rows.Next() {
		// get RawBytes from data
		err = rows.Scan(scanArgs...)
		if err != nil {
			return nil, fmt.Errorf("Mysql scan error: %v", err)
		}

		// Now do something with the data.
		// Here we just print each column as a string.
		var value string
		element := make(map[string][]string)
		for i, col := range values {
			// Here we can check if the value is nil (NULL value)
			if col == nil {
				value = "n/a"
			} else {
				value = string(col)
			}
			element[columns[i]] = []string{value}
		}
		data = append(data, element)
	}

	if err = rows.Err(); err != nil {
		return nil, fmt.Errorf("Mysql row read error: %v", err)
	}

	return data, nil
}
