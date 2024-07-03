package studentzone.model;

public class UserDetails {
    private String email;
    private String fullName;
    private String about;
    private String country;
    private String address;
    private String phone;
    private String gitHubProfile;
    private String instagramProfile;
    private String linkedInProfile;
    private String college;

    public UserDetails() {
    }

  
    public UserDetails(String email, String fullName, String about, String country, String address, String phone, String gitHubProfile, String instagramProfile, String linkedInProfile, String college) {
        this.email = email;
        this.fullName = fullName;
        this.about = about;
        this.country = country;
        this.address = address;
        this.phone = phone;
        this.gitHubProfile = gitHubProfile;
        this.instagramProfile = instagramProfile;
        this.linkedInProfile = linkedInProfile;
        this.college = college;
    }

   
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGitHubProfile() {
        return gitHubProfile;
    }

    public void setGitHubProfile(String gitHubProfile) {
        this.gitHubProfile = gitHubProfile;
    }

    public String getInstagramProfile() {
        return instagramProfile;
    }

    public void setInstagramProfile(String instagramProfile) {
        this.instagramProfile = instagramProfile;
    }

    public String getLinkedInProfile() {
        return linkedInProfile;
    }

    public void setLinkedInProfile(String linkedInProfile) {
        this.linkedInProfile = linkedInProfile;
    }
    
    public String getCollege() {
    	return college;
    }
    
    public void setCollege(String college)
    {
    	this.college = college;
    }

    @Override
    public String toString() {
        return "UserDetails{" +
                "email='" + email + '\'' +
                ", fullName='" + fullName + '\'' +
                ", about='" + about + '\'' +
                ", country='" + country + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", gitHubProfile='" + gitHubProfile + '\'' +
                ", instagramProfile='" + instagramProfile + '\'' +
                ", linkedInProfile='" + linkedInProfile + '\'' +
                ", college='" + college + '\'' +
                '}';
    }
}
