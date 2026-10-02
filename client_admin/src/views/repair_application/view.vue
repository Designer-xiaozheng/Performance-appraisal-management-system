<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','repair_title') || $check_field('add','repair_title') || $check_field('set','repair_title')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="报修标题" prop="repair_title">
					<el-input id="repair_title" v-model="form['repair_title']" placeholder="请输入报修标题"
							  v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','repair_title')) || (!form['repair_application_id'] && $check_field('add','repair_title'))" :disabled="disabledObj['repair_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','repair_title')">{{form['repair_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','repair_type') || $check_field('add','repair_type') || $check_field('set','repair_type')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="报修类型" prop="repair_type">
					<el-input id="repair_type" v-model="form['repair_type']" placeholder="请输入报修类型"
							  v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','repair_type')) || (!form['repair_application_id'] && $check_field('add','repair_type'))" :disabled="disabledObj['repair_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','repair_type')">{{form['repair_type']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','related_pictures') || $check_field('add','related_pictures') || $check_field('set','related_pictures')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="相关图片" prop="related_pictures">
					<el-upload :disabled="disabledObj['related_pictures_isDisabled']" id="related_pictures" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_related_pictures"
						:show-file-list="false" v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','related_pictures')) || (!form['repair_application_id'] && $check_field('add','related_pictures'))">
						<img v-if="form['related_pictures']" :src="$fullUrl(form['related_pictures'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','related_pictures')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['related_pictures'])" :preview-src-list="[$fullUrl(form['related_pictures'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','application_time') || $check_field('add','application_time') || $check_field('set','application_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="申请时间" prop="application_time">
					<el-date-picker :disabled="disabledObj['application_time_isDisabled']" v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','application_time')) || (!form['repair_application_id'] && $check_field('add','application_time'))" id="application_time"
						v-model="form['application_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','application_time')">{{form['application_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','owner_account_number') || $check_field('add','owner_account_number') || $check_field('set','owner_account_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="业主账号" prop="owner_account_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_owner_account_number(form['owner_account_number']) }}
							<!--<el-input id="business_name" v-model="form['owner_account_number']" placeholder="请输入业主账号"-->
							<!--v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','owner_account_number')) || (!form['repair_application_id'] && $check_field('add','owner_account_number'))" :disabled="disabledObj['owner_account_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','owner_account_number')">{{form['owner_account_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','owner_account_number')) || (!form['repair_application_id'] && $check_field('add','owner_account_number'))" id="owner_account_number" v-model="form['owner_account_number']" :disabled="disabledObj['owner_account_number_isDisabled']">
								<el-option v-for="o in list_user_owner_account_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','owner_account_number')" id="owner_account_number" v-model="form['owner_account_number']" :disabled="true">
								<el-option v-for="o in list_user_owner_account_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="owner_account_number" v-model="form['owner_account_number']" :disabled="disabledObj['owner_account_number_isDisabled']">
							<el-option v-for="o in list_user_owner_account_number" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="姓名" prop="full_name">
					<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','full_name')) || (!form['repair_application_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','building_no') || $check_field('add','building_no') || $check_field('set','building_no')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="楼栋号" prop="building_no">
					<el-input id="building_no" v-model="form['building_no']" placeholder="请输入楼栋号"
							  v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','building_no')) || (!form['repair_application_id'] && $check_field('add','building_no'))" :disabled="disabledObj['building_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','building_no')">{{form['building_no']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','house_number') || $check_field('add','house_number') || $check_field('set','house_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="门牌号" prop="house_number">
					<el-input id="house_number" v-model="form['house_number']" placeholder="请输入门牌号"
							  v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','house_number')) || (!form['repair_application_id'] && $check_field('add','house_number'))" :disabled="disabledObj['house_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','house_number')">{{form['house_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','related_content') || $check_field('add','related_content') || $check_field('set','related_content')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="相关内容" prop="related_content">
					<el-input type="textarea" id="related_content" v-model="form['related_content']" placeholder="请输入相关内容"
						v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','related_content')) || (!form['repair_application_id'] && $check_field('add','related_content'))" :disabled="disabledObj['related_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','related_content')">{{form['related_content']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','reply_content') || $check_field('add','reply_content') || $check_field('set','reply_content')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="回复内容" prop="reply_content">
					<el-input type="textarea" id="reply_content" v-model="form['reply_content']" placeholder="请输入回复内容"
						v-if="user_group === '管理员' || (form['repair_application_id'] && $check_field('set','reply_content')) || (!form['repair_application_id'] && $check_field('add','reply_content'))" :disabled="disabledObj['reply_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reply_content')">{{form['reply_content']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "repair_application_id",
				url_add: "~/api/repair_application/add?",
				url_set: "~/api/repair_application/set?",
				url_get_obj: "~/api/repair_application/get_obj?",
				url_upload: "~/api/repair_application/upload?",

				query: {
					"repair_application_id": 0,
				},

				form: {
					"repair_title":'', // 报修标题
					"repair_type":'', // 报修类型
					"related_pictures":'', // 相关图片
					"application_time":'', // 申请时间
					"owner_account_number": 0, // 业主账号
					"full_name":'', // 姓名
					"building_no":'', // 楼栋号
					"house_number":'', // 门牌号
					"related_content":'', // 相关内容
					"reply_content":'', // 回复内容
					"repair_application_id": 0, // ID

				},
				disabledObj:{
					"repair_title_isDisabled": false,
					"repair_type_isDisabled": false,
					"related_pictures_isDisabled": false,
					"application_time_isDisabled": false,
					"owner_account_number_isDisabled": false,
					"full_name_isDisabled": false,
					"building_no_isDisabled": false,
					"house_number_isDisabled": false,
					"related_content_isDisabled": false,
					"reply_content_isDisabled": false,
				},
				// 用户列表
				list_user_owner_account_number: [],
				// 用户组
				group_user_owner_account_number: "",

			}
		},
		methods: {
			/**
			 * 上传相关图片
			 * @param {Object} param图片参数
			 */
			upload_related_pictures(param){
				this.uploadFile(param.file, "related_pictures");
			},
			/**
			 * 获取业主用户列表
			 */
			async get_list_user_owner_account_number() {
                // if(this.user_group !== "管理员" && this.form["owner_account_number"] === 0) {
                //     this.form["owner_account_number"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=业主");
                if(json.result && json.result.list){
                    this.list_user_owner_account_number = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			/**
			 * 获取业主用户组
			 */
			async get_group_user_owner_account_number() {
				this.form["owner_account_number"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=业主");
				if(json.result && json.result.obj){
					this.group_user_owner_account_number = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_owner_account_number(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_owner_account_number.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
						for (let key in _this.form) {
							arrForm.push(key)
						}
						for (var i=0;i<arr.length;i++){
							for (var j=0;j<arrForm.length;j++){
								if (arr[i]===arrForm[j]){
									if (arr[i]!=="owner_account_number") {
										_this.form[arrForm[j]] = res.result.obj[arr[i]]
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
										break;
									}else {
										_this.disabledObj[arrForm[j] + '_isDisabled'] = true
									}
								}
							}
						}
					}
				});
			},
			get_user_owner_account_number(id){
				var obj = this.list_user_owner_account_number.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				/**
				* 请求列表前
				* @param {Object} param
				*/
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
						case "业主账号":
							if(param["owner_account_number"] > 0){
								param["owner_account_number"] = this.user.user_id;
							}
							break;
					}
				}
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							if(dbKey === "charging_standard"){
								this.form['charging_rules'] = form[dbKey];
								this.disabledObj['charging_rules_isDisabled'] = true;
							};
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				this.form["application_time"] = this.$toTime(parseInt(this.form["application_time"]),"yyyy-MM-dd")
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["application_time"]) > 9999){
					this.form["application_time"] = this.$toTime(parseInt(this.form["application_time"]),"yyyy-MM-dd")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/repair_application/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/repair_application/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/repair_application/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/repair_application/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/repair_application/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_user_owner_account_number();
			this.get_group_user_owner_account_number();
		}
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
