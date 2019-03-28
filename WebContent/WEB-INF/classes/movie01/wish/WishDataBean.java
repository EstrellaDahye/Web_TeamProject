package movie01.wish;

public class WishDataBean {
	
	private String num; // 글 번호
	private String id; //id
	private String director; //감독
	private String title; //제목
	private String category; //카테고리
	   
	public String getNum(){
		return num;
	}
	public void setNum(String num){
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
