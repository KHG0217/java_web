package my.dto;

public class MyDto {
	int num;
	String name;
	String work;
	String issue;
	String date;

	public MyDto() {}

	public MyDto(int num, String name, String work, String issue, String date) {
		super();
		this.num = num;
		this.name = name;
		this.work = work;
		this.issue = issue;
		this.date = date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}
