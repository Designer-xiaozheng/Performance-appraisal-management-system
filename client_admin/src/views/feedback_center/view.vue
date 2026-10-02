<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','feedback_title') || $check_field('add','feedback_title') || $check_field('set','feedback_title')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="反馈标题" prop="feedback_title">
					<el-input id="feedback_title" v-model="form['feedback_title']" placeholder="请输入反馈标题"
							  v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','feedback_title')) || (!form['feedback_center_id'] && $check_field('add','feedback_title'))" :disabled="disabledObj['feedback_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','feedback_title')">{{form['feedback_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','feedback_type') || $check_field('add','feedback_type') || $check_field('set','feedback_type')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="反馈类型" prop="feedback_type">
					<el-select id="feedback_type" v-model="form['feedback_type']"
						v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','feedback_type')) || (!form['feedback_center_id'] && $check_field('add','feedback_type'))">
						<el-option v-for="o in list_feedback_type" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','feedback_type')">{{form['feedback_type']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','feedback_time') || $check_field('add','feedback_time') || $check_field('set','feedback_time')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="反馈时间" prop="feedback_time">
					<el-date-picker :disabled="disabledObj['feedback_time_isDisabled']" v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','feedback_time')) || (!form['feedback_center_id'] && $check_field('add','feedback_time'))" id="feedback_time"
						v-model="form['feedback_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','feedback_time')">{{form['feedback_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','owner_account_number') || $check_field('add','owner_account_number') || $check_field('set','owner_account_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="业主账号" prop="owner_account_number">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_owner_account_number(form['owner_account_number']) }}
							<!--<el-input id="business_name" v-model="form['owner_account_number']" placeholder="请输入业主账号"-->
							<!--v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','owner_account_number')) || (!form['feedback_center_id'] && $check_field('add','owner_account_number'))" :disabled="disabledObj['owner_account_number_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','owner_account_number')">{{form['owner_account_number']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','owner_account_number')) || (!form['feedback_center_id'] && $check_field('add','owner_account_number'))" id="owner_account_number" v-model="form['owner_account_number']" :disabled="disabledObj['owner_account_number_isDisabled']">
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
			<el-col v-if="user_group === '管理员' || $check_field('get','feedback_content') || $check_field('add','feedback_content') || $check_field('set','feedback_content')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="反馈内容" prop="feedback_content">
					<el-input type="textarea" id="feedback_content" v-model="form['feedback_content']" placeholder="请输入反馈内容"
						v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','feedback_content')) || (!form['feedback_center_id'] && $check_field('add','feedback_content'))" :disabled="disabledObj['feedback_content_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','feedback_content')">{{form['feedback_content']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','reply_content') || $check_field('add','reply_content') || $check_field('set','reply_content')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="回复内容" prop="reply_content">
					<el-input type="textarea" id="reply_content" v-model="form['reply_content']" placeholder="请输入回复内容"
						v-if="user_group === '管理员' || (form['feedback_center_id'] && $check_field('set','reply_content')) || (!form['feedback_center_id'] && $check_field('add','reply_content'))" :disabled="disabledObj['reply_content_isDisabled']"></el-input>
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
				field: "feedback_center_id",
				url_add: "~/api/feedback_center/add?",
				url_set: "~/api/feedback_center/set?",
				url_get_obj: "~/api/feedback_center/get_obj?",
				url_upload: "~/api/feedback_center/upload?",

				query: {
					"feedback_center_id": 0,
				},

				form: {
					"feedback_title":'', // 反馈标题
					"feedback_type":'', // 反馈类型
					"feedback_time":'', // 反馈时间
					"owner_account_number": 0, // 业主账号
					"feedback_content":'', // 反馈内容
					"reply_content":'', // 回复内容
					"feedback_center_id": 0, // ID

				},
				disabledObj:{
					"feedback_title_isDisabled": false,
					"feedback_type_isDisabled": false,
					"feedback_time_isDisabled": false,
					"owner_account_number_isDisabled": false,
					"feedback_content_isDisabled": false,
					"reply_content_isDisabled": false,
				},
				//反馈类型选项列表
				list_feedback_type: ['建议','投诉'],
				// 用户列表
				list_user_owner_account_number: [],
				// 用户组
				group_user_owner_account_number: "",

			}
		},
		methods: {
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
				this.form["feedback_time"] = this.$toTime(parseInt(this.form["feedback_time"]),"yyyy-MM-dd")
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
				if(parseInt(this.form["feedback_time"]) > 9999){
					this.form["feedback_time"] = this.$toTime(parseInt(this.form["feedback_time"]),"yyyy-MM-dd")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/feedback_center/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback_center/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback_center/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback_center/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/feedback_center/view','get');
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
