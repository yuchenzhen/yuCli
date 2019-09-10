package com.white.ycli.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JobResult implements Serializable {
    private static final long serialVersionUID = -1840831686851699943L;

    /**
     * 主键
     */
    private Long id;

}
