package com.knowledgegraph.neo4j.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * @TableName paper
 */
@TableName(value ="paper")
@Data
public class Paper implements Serializable {
    @TableId(value = "id")
    private Long id;

    private String title;

    private Long publicationYear;

    private String conferenceJournal;

    private static final long serialVersionUID = 1L;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Paper other = (Paper) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getPublicationYear() == null ? other.getPublicationYear() == null : this.getPublicationYear().equals(other.getPublicationYear()))
            && (this.getConferenceJournal() == null ? other.getConferenceJournal() == null : this.getConferenceJournal().equals(other.getConferenceJournal()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getPublicationYear() == null) ? 0 : getPublicationYear().hashCode());
        result = prime * result + ((getConferenceJournal() == null) ? 0 : getConferenceJournal().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", title=").append(title);
        sb.append(", publicationYear=").append(publicationYear);
        sb.append(", conferenceJournal=").append(conferenceJournal);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}