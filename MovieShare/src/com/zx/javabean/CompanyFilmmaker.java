package com.zx.javabean;

public class CompanyFilmmaker implements Comparable<CompanyFilmmaker>{
	private Filmmaker filmmaker;
	private Integer companyCount;
	
	
	public CompanyFilmmaker(Filmmaker filmmaker,Integer companyCount){
		this.filmmaker = filmmaker;
		this.companyCount = companyCount;
	}
	public Filmmaker getFilmmaker() {
		return filmmaker;
	}
	public void setFilmmaker(Filmmaker filmmaker) {
		this.filmmaker = filmmaker;
	}
	public Integer getCompanyCount() {
		return companyCount;
	}
	public void setCompanyCount(Integer companyCount) {
		this.companyCount = companyCount;
	}
	
	
	
	@Override
	public String toString() {
		return "CompanyFilmmaker [filmmaker=" + filmmaker.getFilmmakerName() + ", companyCount=" + companyCount + "]\n";
	}
	@Override
	public int compareTo(CompanyFilmmaker cf) {
		if(this.companyCount>cf.companyCount){
			return -1;
		}else if(this.companyCount<cf.companyCount){
			return 1;
		}
		return 0;
	}
	
}
