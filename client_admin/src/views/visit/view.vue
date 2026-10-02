<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','visiting_account') || $check_field('add','visiting_account') || $check_field('set','visiting_account')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="来访账号" prop="visiting_account">
						<div v-if="user_group !== '管理员'">
							{{ get_user_session_visiting_account(form['visiting_account']) }}
							<!--<el-input id="business_name" v-model="form['visiting_account']" placeholder="请输入来访账号"-->
							<!--v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','visiting_account')) || (!form['visit_id'] && $check_field('add','visiting_account'))" :disabled="disabledObj['visiting_account_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','visiting_account')">{{form['visiting_account']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','visiting_account')) || (!form['visit_id'] && $check_field('add','visiting_account'))" id="visiting_account" v-model="form['visiting_account']" :disabled="disabledObj['visiting_account_isDisabled']">
								<el-option v-for="o in list_user_visiting_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','visiting_account')" id="visiting_account" v-model="form['visiting_account']" :disabled="true">
								<el-option v-for="o in list_user_visiting_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="visiting_account" v-model="form['visiting_account']" :disabled="disabledObj['visiting_account_isDisabled']">
							<el-option v-for="o in list_user_visiting_account" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="姓名" prop="full_name">
					<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','full_name')) || (!form['visit_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','visit_the_owner') || $check_field('add','visit_the_owner') || $check_field('set','visit_the_owner')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="探访业主" prop="visit_the_owner">
						<el-select v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','visit_the_owner')) || (!form['visit_id'] && $check_field('add','visit_the_owner'))" id="visit_the_owner" v-model="form['visit_the_owner']" :disabled="disabledObj['visit_the_owner_isDisabled']">
							<el-option v-for="o in list_user_visit_the_owner" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','visit_the_owner')" id="visit_the_owner" v-model="form['visit_the_owner']" :disabled="true">
							<el-option v-for="o in list_user_visit_the_owner" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','name_of_owner') || $check_field('add','name_of_owner') || $check_field('set','name_of_owner')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="业主姓名" prop="name_of_owner">
					<el-input id="name_of_owner" v-model="form['name_of_owner']" placeholder="请输入业主姓名"
							  v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','name_of_owner')) || (!form['visit_id'] && $check_field('add','name_of_owner'))" :disabled="disabledObj['name_of_owner_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','name_of_owner')">{{form['name_of_owner']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','building_no') || $check_field('add','building_no') || $check_field('set','building_no')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="楼栋号" prop="building_no">
					<el-input id="building_no" v-model="form['building_no']" placeholder="请输入楼栋号"
							  v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','building_no')) || (!form['visit_id'] && $check_field('add','building_no'))" :disabled="disabledObj['building_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','building_no')">{{form['building_no']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','house_number') || $check_field('add','house_number') || $check_field('set','house_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="门牌号" prop="house_number">
					<el-input id="house_number" v-model="form['house_number']" placeholder="请输入门牌号"
							  v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','house_number')) || (!form['visit_id'] && $check_field('add','house_number'))" :disabled="disabledObj['house_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','house_number')">{{form['house_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','owner_confirmation_status') || $check_field('add','owner_confirmation_status') || $check_field('set','owner_confirmation_status')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="业主确认状态" prop="owner_confirmation_status">
					<el-select id="owner_confirmation_status" v-model="form['owner_confirmation_status']"
						v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','owner_confirmation_status')) || (!form['visit_id'] && $check_field('add','owner_confirmation_status'))">
						<el-option v-for="o in list_owner_confirmation_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','owner_confirmation_status')">{{form['owner_confirmation_status']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','reason_for_visit') || $check_field('add','reason_for_visit') || $check_field('set','reason_for_visit')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="来访原因" prop="reason_for_visit">
					<el-input type="textarea" id="reason_for_visit" v-model="form['reason_for_visit']" placeholder="请输入来访原因"
						v-if="user_group === '管理员' || (form['visit_id'] && $check_field('set','reason_for_visit')) || (!form['visit_id'] && $check_field('add','reason_for_visit'))" :disabled="disabledObj['reason_for_visit_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reason_for_visit')">{{form['reason_for_visit']}}</div>
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
				field: "visit_id",
				url_add: "~/api/visit/add?",
				url_set: "~/api/visit/set?",
				url_get_obj: "~/api/visit/get_obj?",
				url_upload: "~/api/visit/upload?",

				query: {
					"visit_id": 0,
				},

				form: {
					"visiting_account": 0, // 来访账号
					"full_name":'', // 姓名
					"visit_the_owner": 0, // 探访业主
					"name_of_owner":'', // 业主姓名
					"building_no":'', // 楼栋号
					"house_number":'', // 门牌号
					"owner_confirmation_status":'', // 业主确认状态
					"reason_for_visit":'', // 来访原因
					"visit_id": 0, // ID

				},
				disabledObj:{
					"visiting_account_isDisabled": false,
					"full_name_isDisabled": false,
					"visit_the_owner_isDisabled": false,
					"name_of_owner_isDisabled": false,
					"building_no_isDisabled": false,
					"house_number_isDisabled": false,
					"owner_confirmation_status_isDisabled": false,
					"reason_for_visit_isDisabled": false,
				},
				// 用户列表
				list_user_visiting_account: [],
				// 用户组
				group_user_visiting_account: "",
				// 用户列表
				list_user_visit_the_owner: [],
				//业主确认状态选项列表
				list_owner_confirmation_status: ['已确认','已否定'],

			}
		},
		methods: {
			/**
			 * 获取访客用户列表
			 */
			async get_list_user_visiting_account() {
                // if(this.user_group !== "管理员" && this.form["visiting_account"] === 0) {
                //     this.form["visiting_account"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=访客");
                if(json.result && json.result.list){
                    this.list_user_visiting_account = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			/**
			 * 获取访客用户组
			 */
			async get_group_user_visiting_account() {
				this.form["visiting_account"] = this.user.user_id;
				var json = await this.$get("~/api/user_group/get_obj?name=访客");
				if(json.result && json.result.obj){
					this.group_user_visiting_account = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_visiting_account(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_visiting_account.source_table+"/get_obj?"
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
									if (arr[i]!=="visiting_account") {
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
			get_user_visiting_account(id){
				var obj = this.list_user_visiting_account.getObj({"user_id":id});
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
			 * 获取业主用户列表
			 */
			async get_list_user_visit_the_owner() {
                // if(this.user_group !== "管理员" && this.form["visit_the_owner"] === 0) {
                //     this.form["visit_the_owner"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=业主");
                if(json.result && json.result.list){
                    this.list_user_visit_the_owner = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			get_user_visit_the_owner(id){
				var obj = this.list_user_visit_the_owner.getObj({"user_id":id});
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
						case "来访账号":
							if(param["visiting_account"] > 0){
								param["visiting_account"] = this.user.user_id;
							}
							break;
						case "探访业主":
							if(param["visit_the_owner"] > 0){
								param["visit_the_owner"] = this.user.user_id;
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
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/visit/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/visit/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/visit/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/visit/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/visit/view','get');
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
			this.get_list_user_visiting_account();
			this.get_group_user_visiting_account();
			this.get_list_user_visit_the_owner();
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
