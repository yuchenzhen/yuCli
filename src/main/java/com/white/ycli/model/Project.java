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
public class Project implements Serializable {
    private static final long serialVersionUID = -1840831686851699943L;

    /**
     * 主键
     */
    private Long id;

    // 项目所属人
    private Long userId;

    // 项目所属组
    private String userGroup;

    // 项目名称
    private String name;
}
