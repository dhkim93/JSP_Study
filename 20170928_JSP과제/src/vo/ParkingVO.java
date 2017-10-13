package vo;

public class ParkingVO {
	private String parkno;
	private String carno;
	private String grade;
	private String tstat;
	private String indate;
	private String outdate;

	public ParkingVO(String parkno, String carno, String grade, String tstat,
			String indate, String outdate) {
		this.parkno = parkno;
		this.carno = carno;
		this.grade = grade;
		this.tstat = tstat;
		this.indate = indate;
		this.outdate = outdate;
	}

	public String getParkno() {
		return parkno;
	}

	public String getCarno() {
		return carno;
	}

	public String getGrade() {
		return grade;
	}

	public String getTstat() {
		return tstat;
	}

	public String getIndate() {
		return indate;
	}

	public String getOutdate() {
		return outdate;
	}

	public void setParkno(String parkno) {
		this.parkno = parkno;
	}

	public void setCarno(String carno) {
		this.carno = carno;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public void setTstat(String tstat) {
		this.tstat = tstat;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}

}
