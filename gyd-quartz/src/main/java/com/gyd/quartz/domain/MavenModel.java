package com.gyd.quartz.domain;


import java.util.Objects;

public class MavenModel {
    private String groupId;
    private String artifactId;
    private String version;
    private String packaging = "jar";

    @Override
    public int hashCode() {
        return groupId.hashCode() + artifactId.hashCode();
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof MavenModel)) {
            return false;
        }
        return Objects.equals(this.artifactId, ((MavenModel) o).getArtifactId())
                && Objects.equals(this.groupId, ((MavenModel) o).getGroupId());
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getArtifactId() {
        return artifactId;
    }

    public void setArtifactId(String artifactId) {
        this.artifactId = artifactId;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getPackaging() {
        return packaging;
    }

    public void setPackaging(String packaging) {
        this.packaging = packaging;
    }
}
