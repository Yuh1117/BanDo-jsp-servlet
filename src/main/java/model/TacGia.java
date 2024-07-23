package model;

import java.sql.Date;

public class TacGia {
	private String maTacGia;
	private String hoVaTen;
	private Date ngaySinh;
	private String tienSu;
	
	public TacGia() {
		
	}

	public TacGia(String maTacGia, String hoVaTen, Date ngaySinh, String tienSu) {
		this.maTacGia = maTacGia;
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.tienSu = tienSu;
	}

	public String getMaTacGia() {
		return maTacGia;
	}

	public void setMaTacGia(String maTacGia) {
		this.maTacGia = maTacGia;
	}

	public String getHoVaTen() {
		return hoVaTen;
	}

	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getTienSu() {
		return tienSu;
	}

	public void setTienSu(String tienSu) {
		this.tienSu = tienSu;
	}
	
}
