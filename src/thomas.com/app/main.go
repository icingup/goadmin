package main

import (
	"fmt"
	"github.com/julienschmidt/httprouter"
	"html/template"
	"log"
	"net/http"
	"strings"
)

func Index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	/*t, err := template.ParseFiles("template/html/admin/index.html")
	if err != nil {
		log.Println(err)
	}
	t.Execute(w, nil)
	*/
	s1, _ := template.ParseFiles("template/html/admin/header.tmpl", "template/html/admin/index.html")
	s1.ExecuteTemplate(w, "content", nil)
}
func login(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, err := template.ParseFiles("template/html/admin/login.html")
	if err != nil {
		log.Println(err)
	}
	t.Execute(w, nil)

}
func userLogin(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	r.ParseForm()
	fmt.Println(r.Form) //这些信息是输出到服务器端的打印信息
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)
	fmt.Println(r.Form["url_long"])
	for k, v := range r.Form {
		fmt.Println("key:", k)
		fmt.Println("val:", strings.Join(v, ""))
	}
	fmt.Fprintf(w, "hello, %s!\n", r.Form["name"][0])

}
func Hello(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	fmt.Fprintf(w, "hello, %s!\n", ps.ByName("name"))
}

func main() {
	router := httprouter.New()
	router.ServeFiles("/css/*filepath", http.Dir("template/css/"))
	router.ServeFiles("/js/*filepath", http.Dir("template/js/"))
	router.ServeFiles("/img/*filepath", http.Dir("template/img/"))
	router.ServeFiles("/font-awesome/*filepath", http.Dir("template/font-awesome/"))

	router.GET("/", Index)
	router.GET("/hello/:name", Hello)
	router.GET("/login", login)
	router.POST("/login", userLogin)

	log.Fatal(http.ListenAndServe(":8080", router))
}
