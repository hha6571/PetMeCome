package adopt.model.vo;

public class Adopt {
	private int petId;
	private String petName;
	private int petAge;
	private String petGender;
	private String petKind;
	private String neutral;
	private String inoculated;
	private String petStatus;
	private String Status;
	
	public Adopt() {}

	public Adopt(int petId, String petName, int petAge, String petGender, String petKind, String neutral,
			String inoculated, String petStatus, String status) {
		super();
		this.petId = petId;
		this.petName = petName;
		this.petAge = petAge;
		this.petGender = petGender;
		this.petKind = petKind;
		this.neutral = neutral;
		this.inoculated = inoculated;
		this.petStatus = petStatus;
		this.Status = status;
	}
	
	
	
	public int getPetId() {
		return petId;
	}

	public void setPetId(int petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getPetKind() {
		return petKind;
	}

	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}

	public String getNeutral() {
		return neutral;
	}

	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}

	public String getInoculated() {
		return inoculated;
	}

	public void setInoculated(String inoculated) {
		this.inoculated = inoculated;
	}

	public String getPetStatus() {
		return petStatus;
	}

	public void setPetStatus(String petStatus) {
		this.petStatus = petStatus;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		this.Status = status;
	}

	@Override
	public String toString() {
		return "Adopt [petId=" + petId + ", petName=" + petName + ", petAge=" + petAge + ", petGender=" + petGender
				+ ", petKind=" + petKind + ", neutral=" + neutral + ", inoculated=" + inoculated + ", petStatus="
				+ petStatus + ", Status=" + Status + "]";
	}

		
	
	
}
