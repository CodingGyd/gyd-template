<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="网站名称" prop="siteName">
        <el-input
          v-model="queryParams.siteName"
          placeholder="请输入网站名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="网站地址" prop="siteUrl">
        <el-input
          v-model="queryParams.siteUrl"
          placeholder="请输入网站地址"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接口名称" prop="apiName">
        <el-input
          v-model="queryParams.apiName"
          placeholder="请输入接口名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="请求方式" prop="apiMethod">
        <el-input
          v-model="queryParams.apiMethod"
          placeholder="请输入请求方式"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['script:api:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['script:api:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['script:api:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['script:api:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="apiList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="接口ID" align="center" prop="apiId" />
      <el-table-column label="网站名称" align="center" prop="siteName" />
      <el-table-column label="网站地址" align="center" prop="siteUrl" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="接口状态" align="center" prop="status" />
      <el-table-column label="接口名称" align="center" prop="apiName" />
      <el-table-column label="接口地址" align="center" prop="apiUrl" />
      <el-table-column label="接口参数" align="center" prop="apiParams" />
      <el-table-column label="请求方式" align="center" prop="apiMethod" />
      <el-table-column label="请求头" align="center" prop="apiHeaders" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['script:api:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['script:api:remove']"
          >删除</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-execution"
            @click="handleExec(scope.row)"
          >执行一次</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改网站接口信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="网站名称" prop="siteName">
          <el-input v-model="form.siteName" placeholder="请输入网站名称" />
        </el-form-item>
        <el-form-item label="网站地址" prop="siteUrl">
          <el-input v-model="form.siteUrl" placeholder="请输入网站地址" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="接口名称" prop="apiName">
          <el-input v-model="form.apiName" placeholder="请输入接口名称" />
        </el-form-item>
        <el-form-item label="接口地址" prop="apiUrl">
          <el-input v-model="form.apiUrl" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="接口参数" prop="apiParams">
          <el-input v-model="form.apiParams" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="接口请求方式" prop="apiMethod">
          <el-input v-model="form.apiMethod" placeholder="请输入接口请求方式" />
        </el-form-item>
        <el-form-item label="请求头" prop="apiHeaders">
          <el-input v-model="form.apiHeaders" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listApi, getApi, delApi, addApi, updateApi,execApi  } from "@/api/script/api";

export default {
  name: "Api",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 网站接口信息表格数据
      apiList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        siteName: null,
        siteUrl: null,
        status: null,
        apiName: null,
        apiUrl: null,
        apiParams: null,
        apiMethod: null,
        apiHeaders: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        siteName: [
          { required: true, message: "网站名称不能为空", trigger: "blur" }
        ],
        siteUrl: [
          { required: true, message: "网站地址不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询网站接口信息列表 */
    getList() {
      this.loading = true;
      listApi(this.queryParams).then(response => {
        this.apiList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        apiId: null,
        siteName: null,
        siteUrl: null,
        status: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        apiName: null,
        apiUrl: null,
        apiParams: null,
        apiMethod: null,
        apiHeaders: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.apiId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加网站接口信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const apiId = row.apiId || this.ids
      getApi(apiId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改网站接口信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.apiId != null) {
            updateApi(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addApi(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const apiIds = row.apiId || this.ids;
      this.$modal.confirm('是否确认删除网站接口信息编号为"' + apiIds + '"的数据项？').then(function() {
        return delApi(apiIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 执行操作 */
    handleExec(row) {
      this.reset();
      execApi(row).then(response => {
        this.$modal.msgSuccess("操作成功");
      });
    },

    /** 导出按钮操作 */
    handleExport() {
      this.download('script/api/export', {
        ...this.queryParams
      }, `api_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
