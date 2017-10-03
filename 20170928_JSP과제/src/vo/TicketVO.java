package vo;

public class TicketVO {
	private String ticketNum;
	private String carNum;
	private String tel;
	private String grade;
	private String status;
	private String startDate;
	private String endDate;

	public TicketVO(String ticketNum, String carNum, String tel, String grade,
			String status, String startDate, String endDate) {
		this.ticketNum = ticketNum;
		this.carNum = carNum;
		this.tel = tel;
		this.grade = grade;
		this.status = status;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getTicketNum() {
		return ticketNum;
	}

	public String getCarNum() {
		return carNum;
	}

	public String getTel() {
		return tel;
	}

	public String getGrade() {
		return grade;
	}

	public String getStatus() {
		return status;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setTicketNum(String ticketNum) {
		this.ticketNum = ticketNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

}
